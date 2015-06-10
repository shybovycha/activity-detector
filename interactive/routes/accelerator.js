var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('accelerator', { title: 'Accelerator' });
});

module.exports = router;
