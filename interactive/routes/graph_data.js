var express = require('express');
var Redis = require('ioredis');
var SignalProcessor = require('../lib/signal_processor');

var router = express.Router();
var redis = new Redis();

router.get('/accelerations', function(req, res, next) {
  redis.llen('accel_data').then(function (len) {
    redis.lrange('accel_data', 0, len).then(function (data) {
        var result = new SignalProcessor(data).accelData;

        res.json(result);
    });
  });
});

router.get('/autocorrelation', function(req, res, next) {
  redis.llen('accel_data').then(function (len) {
    redis.lrange('accel_data', 0, len).then(function (points) {
        var result = new SignalProcessor(points).autocorrelation;

        res.json(result);
    });
  });
});

router.get('/filtered', function(req, res, next) {
  redis.llen('accel_data').then(function (len) {
    redis.lrange('accel_data', 0, len).then(function (points) {
        var result = new SignalProcessor(points).filteredAccelData;

        res.json(result);
    });
  });
});

module.exports = router;
