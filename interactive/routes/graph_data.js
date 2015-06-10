var express = require('express');
var Redis = require('ioredis');

var router = express.Router();
var redis = new Redis();

router.get('/', function(req, res, next) {
  redis.llen('accel_data').then(function (len) {
    redis.lrange('accel_data', 0, len).then(function (data) {
        var result = data.map(function(data) { return JSON.parse(data); }).reverse();

        res.json(result);
    });
  });
});

module.exports = router;
