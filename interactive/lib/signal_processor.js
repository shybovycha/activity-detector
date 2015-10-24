"use strict"

Number.prototype.mod = function (n) {
    return ((this % n) + n) % n;
};

class SignalProcessor {
    constructor(accelData) {
        this.setAccelData(accelData);
    }

    static fromJsons(data) {
        var result = data
            .map(function (data) { return JSON.parse(data); })
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
    
    getParams(f, median) {
        var //params = {},
            threshold = 10;
        
        //for (var axe of ['x', 'y', 'z']) {
            var //f = data[axe].map(e => { return e[1]; }),
                n = f.length,
                // median = f.reduce((acc, e) => { return acc + e; }, 0) / n,
                // maxVal = f.reduce((acc, e) => { return (e > acc) ? e : acc; }, 0),
                // minVal = f.reduce((acc, e) => { return (e < acc) ? e : acc; }, 0),
                // amplitude = maxVal - minVal,
                N = 0,
                i = 0;
                
            while (i < n) {
                while (f[i++] >= median);
                N++;
                while (f[i++] < median || f[i + threshold] < median);
            }
            
            //params[axe] = {
            return {
                //median: median,
                //amplitude: amplitude,
                repetitions: N
            };
        //}

        // return params;
    }

    findPeriods() {
        var periods = {},
            data = this.filteredAccelData;

        for (var axe of ['x', 'y', 'z']) {
            var f = data[axe].map(e => { return e[1]; }),
                maxCorrelation = 0,
                maxStart = 0,
                maxWidth = 0,
                dt = data[axe][1][0] - data[axe][0][0];

            for (var width = 25; width < f.length / 2; width = parseInt(width * 1.5)) {
                for (var start = 0; start < f.length - width; start++) {
                    var x = f.slice(start, start + width + 1),
                        y = f.slice(start + width, start + (width * 2) + 1),
                        correlation = this.getCorrelationCoefficient(x, y);
                        
                    if (correlation > maxCorrelation) {
                        maxCorrelation = correlation;
                        maxStart = start;
                        maxWidth = width;
                    }
                }
            }
            
            periods[axe] = {
                correlation: maxCorrelation,
                windowWidth: maxWidth,
                windowStart: maxStart,
                period: width * dt
            };
        }

        return periods;
    }
    
    getAbsVector() {
        var f = this.filteredAccelData,
            a = f.x.map((e, i) => { return [ f.x[i][0], Math.sqrt(Math.pow(f.x[i][1], 2) + Math.pow(f.y[i][1], 2) + Math.pow(f.z[i][1], 2)) ] });
            
        return a;
    }
    
    getRepetitions() {
        var f = this.filteredAccelData,
            a = f.x.map((e, i) => { return Math.sqrt(Math.pow(f.x[i][1], 2) + Math.pow(f.y[i][1], 2) + Math.pow(f.z[i][1], 2)) })
        
        var threshold = 20,
            median = 7.5;
        
        var n = a.length,
            N = 0,
            i = 0;
            
        while (i < n) {
            while (a[i++] >= median || a[i + threshold] >= median);
            N++;
            while (a[i++] < median);
        }
        
        return N;
    }

    getCorrelationCoefficient(x, y) {
        var n = x.length,
            xs = x.reduce((acc, e) => { return acc + e; }, 0) / n,
            ys = y.reduce((acc, e) => { return acc + e; }, 0) / n,
            xys = x.reduce((acc, e, i) => { return acc + (x[i] * y[i]); }, 0) / n,
            s2x = ((x.reduce((acc, e) => { return acc + (e * e); }, 0) / n)) - Math.pow(xs, 2),
            s2y = ((y.reduce((acc, e) => { return acc + (e * e); }, 0) / n)) - Math.pow(ys, 2),
            sx = Math.sqrt(s2x),
            sy = Math.sqrt(s2y),
            coefficient = (xys - (xs * ys)) / (sx * sy);

        return coefficient;
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
            for (var axis of ['x', 'y', 'z']) {
                var Nrff = this._Rff.length,
                    i0 = parseInt(Nrff / 2),
                    i = i0;

                while (
                    //this._Rff[i + 4][axis] <= this._Rff[i + 3][axis] &&
                    //this._Rff[i + 3][axis] <= this._Rff[i + 2][axis] &&
                    //this._Rff[i + 2][axis] <= this._Rff[i + 1][axis] &&
                    this._Rff[i + 1][axis] <= this._Rff[i][axis] &&
                    i < Nrff - 2
                    ) i++;

                while (
                    //this._Rff[i + 4][axis] >= this._Rff[i + 3][axis] &&
                    //this._Rff[i + 3][axis] >= this._Rff[i + 2][axis] &&
                    //this._Rff[i + 2][axis] >= this._Rff[i + 1][axis] &&
                    this._Rff[i + 1][axis] >= this._Rff[i][axis] &&
                    i < Nrff - 2
                    ) i++;

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

        for (var axis of ['x', 'y', 'z']) {
            var k = 1 / (K + 1);

            for (var i = K; i < N; i++) {
                var sum = 0;

                i = parseInt(i);

                for (var j = -K; j <= 0; j++) {
                    var ij = (i + j).mod(N);

                    sum += f[ij][axis];
                }

                g[axis].push([i, (k * sum)]);
            }
        }

        return g;
    }

    get filteredAccelData() {
        return SignalProcessor.filterData(this.accelData)
    }

    get_isFunctionMonotonic(f, T) {
        // return (1..N / T).map(function(i) { return (f(i*T + T/2) - f(i*T)) / (f((i+1)*T) - f((i+1)*T + T/2)); }).all(function(e) { return e < 0; });
        return false;
    }

    getFourierFrequencyPeaks(start, end) {
        var data = this.filteredAccelData,
            g = { x: [], y: [], z: [] };
        //N = f.length;

        for (var axis of ['x', 'y', 'z']) {
            var f = data[axis],
                N = f.length;

            for (var k = 2; k < N - 1; k++) {
                var A_sum = 0,
                    B_sum = 0;

                for (var i = 0; i < N - 1; i++) {
                    var n_2_pi_k_i = (2 * Math.PI * k * i) / N;

                    // A_sum += f[i][axis] * Math.cos(n_2_pi_k_i);
                    // B_sum += f[i][axis] * Math.sin(n_2_pi_k_i);

                    A_sum += f[i][1] * Math.cos(n_2_pi_k_i);
                    B_sum += f[i][1] * Math.sin(n_2_pi_k_i);
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
