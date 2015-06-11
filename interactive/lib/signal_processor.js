Number.prototype.mod = function(n) {
    return ((this%n)+n)%n;
};

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

    static reverseCoords(f) {
        var result = { x: [], y: [], z: [] };

        f.forEach(function (e) {
            result.x.push(e.x);
            result.y.push(e.y);
            result.z.push(e.z);
        });

        return result;
    }

    static filterData(f, K) {
        if (!K)
            K = 50;

        var g = { x: [], y: [], z: [] },
            N = f.length;

        for (var axis of [ 'x', 'y', 'z' ]) {
            var k = 1 / (K + 1);

            for (var i = K; i < N; i++) {
                var sum = 0;

                i = parseInt(i)

                for (var j = -K; j <= 0; j++) {
                    var ij = (i + j).mod(N);

                    sum += f[ij][axis];
                }

                g[axis].push([ i, (k * sum) ]);
            }
        }

        return g;
    }

    get filteredAccelData() {
        return SignalProcessor.filterData(this.accelData)
        /*var autocorrelation = this.autocorrelation,
            periods = autocorrelation.periods,
            f = this.accelData,
            g = { x: [], y: [], z: [] },
            N = f.length;

        for (var axis of [ 'x', 'y', 'z' ]) {
            var T = periods[axis],
                K = 50,
                k = 1 / (K + 1);

            for (var i = K / 2; i < N - (K / 2); i++) {
                var sum = 0;

                i = parseInt(i)

                for (var j = -K / 2; j <= K / 2; j++) {
                    var ij = (i + j);

                    sum += f[ij][axis];
                }

                g[axis].push([ i, (k * sum) ]);
            }
        }

        return g;*/
    }

    get fourierFrequencyPeaks() {
        var f = this.filteredAccelData,
            g = { x: [], y: [], z: [] };
            //N = f.length;

        for (var axis of [ 'x', 'y', 'z' ]) {
            var N = f[axis].length;

            for (var k = 0; k < N - 1; k++) {
                var A_sum = 0,
                    B_sum = 0;

                for (var i = 0; i < N - 1; i++) {
                    var n_2_pi_k_i = (2 * Math.PI * k * i) / N;

                    // A_sum += f[i][axis] * Math.cos(n_2_pi_k_i);
                    // B_sum += f[i][axis] * Math.sin(n_2_pi_k_i);

                    A_sum += f[axis][i][1] * Math.cos(n_2_pi_k_i);
                    B_sum += f[axis][i][1] * Math.sin(n_2_pi_k_i);
                }

                var Ak = (1 / N) * A_sum,
                    Bk = (1 / N) * B_sum,
                    Ck_modulo = Math.sqrt(Math.pow(Ak, 2) + Math.pow(Bk, 2)) / 2.0;

                g[axis].push(Ck_modulo);
            }
        }

        return g;
    }
}

module.exports = SignalProcessor;