$(document).on('turbolinks:load', function () {
    if ($('#common_expense_property_period_2i') && $('#common_expense_property_period_1i')) {
        $('#common_expense_property_period_2i').wrap("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'></div>");
        $('#common_expense_property_period_1i').wrap("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'></div>");
    }
});

$(document).on('turbolinks:load', function () {
    $('#water_field').bind('input', function () {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#gas_field').bind('input', function () {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#electricity_field').bind('input', function () {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#others_field').bind('input', function () {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#salary_field').bind('input', function () {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#maintenance_field').bind('input', function () {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
});
