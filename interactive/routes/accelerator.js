var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  var socket_params = {
    ip: '10.94.2.150',
    port: '8080'
  };
  
  res.render('accelerator', { title: 'Accelerator', socket_ip: socket_params.ip, socket_port: socket_params.port });
});

module.exports = router;
