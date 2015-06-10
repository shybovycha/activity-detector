var express = require('express');
var Redis = require('ioredis');

var router = express.Router();
var redis = new Redis();

Number.prototype.mod = function(n) {
    return ((this%n)+n)%n;
};

router.get('/accelerations', function(req, res, next) {
  redis.llen('accel_data').then(function (len) {
    redis.lrange('accel_data', 0, len).then(function (data) {
        var result = data.map(function(data) { return JSON.parse(data); }).reverse().sort(function (a, b) { return a.t - b.t; });

        res.json(result);
    });
  });
});

router.get('/autocorrelation', function(req, res, next) {
  redis.llen('accel_data').then(function (len) {
    redis.lrange('accel_data', 0, len).then(function (data) {
        var f = data.map(function(data) { return JSON.parse(data); }).reverse().sort(function (a, b) { return a.t - b.t; });

        var N = f.length,
            T = 100,
            k = 1.0 / N;

        var result = [];

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

            result.push({ t: j, x: k * sumX, y: k * sumY, z: k * sumZ });
        }

        res.json(result);
    });
  });
});

module.exports = router;
