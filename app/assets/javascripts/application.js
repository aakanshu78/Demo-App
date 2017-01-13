//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require c3
//= require d3



function chart(id, option_a, option_b, option_c, option_d) {

    div_name = "#chart" + id;

    var chart = c3.generate({
        bindto: div_name,
        data: {
            columns: [
                ['data1', option_a, option_b, option_c, option_d],
            ],
            types: {
                data1: 'bar'
            }
        },
        axis: {
            y: {
                padding: { bottom: 0 },
                min: 0
            },
            x: {
                padding: { left: 0 },
                min: 0
            }
        }
    });

    setTimeout(function() {
        chart.load({});
    }, 1000);
}

//= require_tree.