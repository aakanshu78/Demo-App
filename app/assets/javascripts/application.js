//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require c3
//= require d3
//= require_tree.


function chart(id, option_a, option_b, option_c, option_d) {
    /*var graph = c3.generate({
        //bindto: document.getElementById("chart_" + id),
        data: {
            columns: [
                ['data1', option_a, option_b, option_c, option_d],
            ],
            type: {
                data1: 'bar'
            }
        },
        bar: {
            width: {
                ratio: 0.7,
            }
        }
    });*/
    div_selector = document.getElementById("#chart_" + id);
    div_name = "#cahrt_" + id;
    console.log(div);
    var chart = c3.generate({
        data: {
            bindto: div_name,
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