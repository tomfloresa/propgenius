$(document).on('turbolinks:load', function() {
    if ($('#common_expense_property_period_2i') && $('#common_expense_property_period_1i')) {
        $('#common_expense_property_period_2i').wrap("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'></div>");
        $('#common_expense_property_period_1i').wrap("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'></div>");
    }
});
$(document).on('turbolinks:load', function() {
    var ctx = document.getElementById("property-types-chart");
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [
                "Red",
                "Blue",
                "Yellow",
                "Green",
                "Purple",
                "Orange"
            ],
            datasets: [
                {
                    label: '# of Votes',
                    data: [
                        12,
                        19,
                        3,
                        5,
                        2,
                        3
                    ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });
});
