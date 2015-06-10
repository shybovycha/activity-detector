var express = require('express');
var katex = require('katex');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('renderer', { katex: katex, title: 'Renderer' });
});

module.exports = router;
