function addSinglePoint(point) {
    var accel_data_chart = $('#accel_data_chart').highcharts();

    if (!accel_data_chart)
        return;

    accel_data_chart.series[0].addPoint([ point.t, point.x ], true, true);
    accel_data_chart.series[1].addPoint([ point.t, point.y ], true, true);
    accel_data_chart.series[2].addPoint([ point.t, point.z ], true, true);
}

function fetchAndAdd() {
    $.getJSON('/graph_data/accelerations', function(data) {
        var accel_data_chart = $('#accel_data_chart').highcharts();

        if (!accel_data_chart)
            return;

        accel_data_chart.series[0].setData(data.map(function (p) { return [ p.t, p.x ]; }));
        accel_data_chart.series[1].setData(data.map(function (p) { return [ p.t, p.y ]; }));
        accel_data_chart.series[2].setData(data.map(function (p) { return [ p.t, p.z ]; }));
    });

    $.getJSON('/graph_data/autocorrelation', function(data) {
        for (var axis of [ 'x', 'y', 'z' ]) {
            var accel_data_chart = $('#autocorrelation_' + axis + '_chart').highcharts();

            if (!accel_data_chart)
                return;

            var centerVal = data[data.length / 2].t;

            accel_data_chart.series[0].setData(data.map(function (p) { return [ p.t, p[axis] ]; }));
            accel_data_chart.xAxis[0].addPlotLine({ color: 'red', dashStyle: 'longdashdot', width: 2, value: centerVal });
        }
    });
}

function initCharts() {
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

    // autocorrelation charts
    for (var axis of [ 'x', 'y', 'z' ]) {
        $('#autocorrelation_' + axis + '_chart').highcharts('StockChart', {
            rangeSelector: {
                selected: 1
            },

            title: {
                text: 'Acceleration (' + axis + ')'
            },

            exporting: {
                enabled: false
            },

            series: [
                {
                    name: axis + ' periodity',
                    data: [],
                    type: 'spline',
                    tooltip: {
                        valueDecimals: 2
                    }
                }
            ]
        });
    }
}

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

    initCharts();
    fetchAndAdd();

    $('#refresh').on('click', function() { 
        fetchAndAdd();
    });

    //setInterval(fetchAndAdd, 2000);
});