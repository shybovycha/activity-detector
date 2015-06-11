var express = require('express');
var katex = require('katex');
var router = express.Router();

router.get('/', function(req, res, next) {
    var dataset = req.query.dataset || 'laying';

    res.render('renderer', { katex: katex, dataset: dataset, title: 'Renderer' });
});

module.exports = router;
