var express = require('express');
var Redis = require('ioredis');
var SignalProcessor = require('../lib/signal_processor');

var router = express.Router();
var redis = new Redis();

router.get('/accelerations', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (data) {
            var result = new SignalProcessor(data).accelData;

            res.json(result);
        });
    });
});

router.get('/periods', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var result = new SignalProcessor(points).findPeriods();

            res.json(result);
        });
    });
});

router.get('/params', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var result = new SignalProcessor(points).findParams();

            res.json(result);
        });
    });
});

router.get('/autocorrelation', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var result = new SignalProcessor(points).autocorrelation;

            res.json(result);
        });
    });
});

router.get('/filtered_autocorrelation', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var autocorr = new SignalProcessor(points).autocorrelation,
                pointsFiltered = SignalProcessor.filterData(autocorr.points, 25),
                result = { points: pointsFiltered, periods: autocorr.periods };

            res.json(result);
        });
    });
});

router.get('/filtered', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var processor = new SignalProcessor(points),
                result = processor.filteredAccelData;
            
            result['a'] = processor.getAbsVector();

            res.json(result);
        });
    });
});

router.get('/repetitions', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var processor = new SignalProcessor(points),
                result = processor.getRepetitions();

            res.json(result);
        });
    });
});

router.get('/transformed', function (req, res, next) {
    var dataset = req.query.dataset || 'laying';
    var redisKey = `accel_data_${dataset}`;

    redis.llen(redisKey).then(function (len) {
        redis.lrange(redisKey, 0, len).then(function (points) {
            var result = new SignalProcessor(points).getFourierFrequencyPeaks();

            res.json(result);
        });
    });
});

module.exports = router;
