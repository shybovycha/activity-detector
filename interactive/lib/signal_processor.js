class SignalProcessor {
    constructor(accelData) {
        this.setAccelData(accelData);
    }

    static fromJsons(data) {
        var result = data
            .map(function(data) { return JSON.parse(data); })
            .reverse()
            .sort(function (a, b) { return a.t - b.t; });

        return result;
    }

    setAccelData(value) {
        this._accelData = SignalProcessor.fromJsons(value);
        this._periods = { x: 0, y: 0, z: 0 };
        this._Rff = [];
    }

    set accelData(value) {
        this.setAccelData(value);
    }

    get accelData() {
        return this._accelData;
    }

    get autocorrelation() {
        this._Rff = [];
        this._periods = { x: 0, y: 0, z: 0 };

        var f = this.accelData;

        {
            var N = f.length,
                T = 100,
                k = 1.0 / N;

            for (var j = -T; j < T; j++) {
                j = parseInt(j);

                var sumX = 0,
                    sumY = 0,
                    sumZ = 0;

                for (var i = 0; i < N; i++) {
                    try {
                        var ij = (i + j).mod(N);
                        sumX += f[i].x * f[ij].x;
                        sumY += f[i].y * f[ij].y;
                        sumZ += f[i].z * f[ij].z;
                    } catch (e) {
                        console.log('i:', i, 'j:', j, '(i + j) % N:', ij, 'f[i]:', f[i], 'f[i+j]:', f[ij]);
                    }
                }

                this._Rff.push({ t: j, x: k * sumX, y: k * sumY, z: k * sumZ });
            }
        }

        {
            for (var axis of [ 'x', 'y', 'z' ]) {
                var Nrff = this._Rff.length,
                    i0 = parseInt(Nrff / 2),
                    i = i0;

                while (this._Rff[i + 1][axis] < this._Rff[i][axis] && i < Nrff - 1) i++;
                while (this._Rff[i + 1][axis] > this._Rff[i][axis] && i < Nrff - 1) i++;

                this._periods[axis] = i - i0;
            }
        }

        var result = {
            points: this._Rff,
            periods: this._periods
        }

        return result;
    }
}

module.exports = SignalProcessor;