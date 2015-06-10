var express = require('express');
var path = require('path');
// var favicon = require('serve-favicon');
var logger = require('morgan');
// var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var Redis = require('ioredis');

var redis = new Redis();

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
//app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public/javascripts')));
app.use(express.static(path.join(__dirname, 'bower_components')));

var renderer = require('./routes/renderer');
var accelerator = require('./routes/accelerator');
var graphData = require('./routes/graph_data');

app.use('/', renderer);
app.use('/accel', accelerator);
app.use('/graph_data', graphData);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});

var io = require('socket.io').listen(8080);

io.set('log level', 1);

// Навешиваем обработчик на подключение нового клиента
io.sockets.on('connection', function (socket) {
  console.log('CONNECTED:', socket.id);

  socket.on('newAccelData', function (params) {
    // socket.broadcast.emit('newAccelData', point);
    redis.lpush(params.dataset, JSON.stringify(params.point));
  });

  socket.on('resetAccelData', function (params) {
    redis.del(params.dataset);
  });

  socket.on('disconnect', function() {
  });
});

module.exports = app;
