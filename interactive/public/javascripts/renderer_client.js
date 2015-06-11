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
        var points = data.points,
            period = data.periods;

        for (var axis of [ 'x', 'y', 'z' ]) {
            var accel_data_chart = $('#autocorrelation_' + axis + '_chart').highcharts();

            if (!accel_data_chart)
                return;

            var centerVal = points[points.length / 2].t;

            accel_data_chart.series[0].setData(points.map(function (p) { return [ p.t, p[axis] ]; }));

            accel_data_chart.xAxis[0].removePlotLine('zero-period-line');

            accel_data_chart.xAxis[0].addPlotLine({
                color: 'red',
                dashStyle: 'longdashdot',
                width: 2,
                value: centerVal,
                id: 'zero-period-line'
            });

            accel_data_chart.xAxis[0].removePlotBand('period-band');

            accel_data_chart.xAxis[0].addPlotBand({
                color: 'yellow',
                from: centerVal,
                to: centerVal + period[axis],
                id: 'period-band',
                label: {
                    text: 'T=' + period[axis]
                }
            });
        }
    });

    $.getJSON('/graph_data/filtered', function (data) {
        var points = data;

        for (var axis of [ 'x', 'y', 'z' ]) {
            var accel_data_chart = $('#filtered_' + axis + '_chart').highcharts();

            if (!accel_data_chart)
                return;

            accel_data_chart.series[0].setData(points[axis]);
        }
    });

    $.getJSON('/graph_data/transformed', function (data) {
        var peaks = data;

        for (var axis of [ 'x', 'y', 'z' ]) {
            var accel_data_chart = $('#discrete_fourier_' + axis + '_chart').highcharts();

            if (!accel_data_chart)
                return;

            accel_data_chart.series[0].setData(peaks[axis]);
        }
    });
}

function initCharts() {
    $('#accel_data_chart').highcharts('StockChart', {
        rangeSelector: {
            selected: 1,
            inputEnabled : false
        },

        title: {
            text: 'Acceleration'
        },

        exporting: {
            enabled: false
        },

        xAxis: {
            labels: {
                formatter: function () {
                    return this.value + 'ms';
                }
            }
        },

        tooltip: {
            headerFormat: '',
            pointFormat: '{point.x} ms = {point.y}'
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
                selected: 1,
                inputEnabled : false
            },

            title: {
                text: 'Periodity (' + axis + ')'
            },

            xAxis: {
                labels: {
                    formatter: function () {
                        return this.value + 'ms';
                    }
                }
            },

            tooltip: {
                headerFormat: '',
                pointFormat: '{point.x} ms = {point.y}'
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

        // filtration
        $('#filtered_' + axis + '_chart').highcharts('StockChart', {
            rangeSelector: {
                selected: 1,
                inputEnabled : false
            },

            title: {
                text: 'Filtered (' + axis + ')'
            },

            xAxis: {
                labels: {
                    formatter: function () {
                        return this.value + 'ms';
                    }
                }
            },

            tooltip: {
                headerFormat: '',
                pointFormat: '{point.x} ms = {point.y}'
            },

            exporting: {
                enabled: false
            },

            series: [
                {
                    name: axis + ' data, filtered',
                    data: [],
                    type: 'spline',
                    tooltip: {
                        valueDecimals: 2
                    }
                }
            ]
        });

        // discrete fourier transformation
        $('#discrete_fourier_' + axis + '_chart').highcharts('StockChart', {
            rangeSelector: {
                selected: 1,
                inputEnabled : false
            },

            title: {
                text: 'Peak frequencies (' + axis + ')'
            },

            xAxis: {
                labels: {
                    formatter: function () {
                        return this.value + 'ms';
                    }
                }
            },

            tooltip: {
                headerFormat: '',
                pointFormat: '{point.x} Hz = {point.y}'
            },

            exporting: {
                enabled: false
            },

            series: [
                {
                    name: axis + ' data, transformed',
                    data: [],
                    type: 'column',
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

    initCharts();
    fetchAndAdd();

    window.refreshEnabled = true;

    $('#refresh').on('click', function() {
        window.refreshEnabled = !window.refreshEnabled;

        if (!window.refreshEnabled) {
            $(this).text('Continue');
        } else {
            $(this).text('Pause');
        }

        fetchAndAdd();
    });

    setInterval(function() {
        if (!window.refreshEnabled)
            return;

        fetchAndAdd();
    }, 1000);
});