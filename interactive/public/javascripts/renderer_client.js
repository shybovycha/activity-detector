function addSinglePoint(point) {
    var accel_data_chart = $('#accel_data_chart').highcharts();

    if (!accel_data_chart)
        return;

    accel_data_chart.series[0].addPoint([ point.t, point.x ], true, true);
    accel_data_chart.series[1].addPoint([ point.t, point.y ], true, true);
    accel_data_chart.series[2].addPoint([ point.t, point.z ], true, true);
}

function fetchAndAdd() {
    $.getJSON('/graph_data', function(data) {
        debugger;

        var accel_data_chart = $('#accel_data_chart').highcharts();

        if (!accel_data_chart)
            return;

        var series1 = accel_data_chart.series[0].data.concat(data.map(function (p) { return [ p.t, p.x ]; }));
        var series2 = accel_data_chart.series[1].data.concat(data.map(function (p) { return [ p.t, p.y ]; }));
        var series3 = accel_data_chart.series[2].data.concat(data.map(function (p) { return [ p.t, p.z ]; }));

        debugger;

        accel_data_chart.series[0].setData(series1);
        accel_data_chart.series[1].setData(series2);
        accel_data_chart.series[2].setData(series3);
    });
}

/*var socket = io.connect('http://192.168.2.237:8080');

socket.on('connect', function (data) {
    // socket.emit('join', 'Hello World from client');
    window.server = socket;
});

socket.on('newAccelData', function (point) {
    addSinglePoint(point);
});*/

$(function () {
    Highcharts.setOptions({
        global : {
            useUTC : false
        }
    });

    var blankData = function () {
        var data = [],
            time = new Date().getTime(),
            timelineWidth = 1000;

        for (var i = -timelineWidth; i <= 0; i++) {
            data.push([ i * 100, 0 ]);
        }

        return data;
    };

    $('#accel_data_chart').highcharts('StockChart', {
        rangeSelector: {
            selected: 1
        },

        title: {
            text: 'Acceleration'
        },

        exporting: {
            enabled: false
        },

        series: [
            {
                name: 'x',
                data: [],
                type: 'spline',
                tooltip: {
                    valueDecimals: 2
                }
            },
            {
                name: 'y',
                data: [],
                type: 'spline',
                tooltip: {
                    valueDecimals: 2
                }
            },
            {
                name: 'z',
                data: [],
                type: 'spline',
                tooltip: {
                    valueDecimals: 2
                }
            }
        ]
    });

    fetchAndAdd();

    //setInterval(fetchAndAdd, 2000);
});