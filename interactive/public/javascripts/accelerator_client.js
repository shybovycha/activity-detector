var socket = io.connect('http://192.168.2.237:8080');

socket.on('connect', function (data) {
    // socket.emit('join', 'Hello World from client');
    window.server = socket;
    $('#status').html('connected');
});

window.ondevicemotion = function (evt) {
    if (!window.server) {
        $('#status').html('no server connection');
        return;
    }

    var now = new Date().getTime();

    if (!window.accelData) {
        window.accelData = { firstTimestamp: now, lastTimestamp: now };
    }

    var dt = now - window.accelData.lastTimestamp,
        t = now - window.accelData.firstTimestamp,
        x = evt.accelerationIncludingGravity.x,
        y = evt.accelerationIncludingGravity.y,
        z = evt.accelerationIncludingGravity.z,
        point = { t: t, x: x, y: y, z: z };

    $('#status').html('&Delta;t = ' + t);

    window.accelData.lastTimestamp = now;

    // window.accelData.push({ lastTimestamp: now, x: x, y: y, z: z });
    window.server.emit('newAccelData', { dataset: 'accel_data', point: point });
};
