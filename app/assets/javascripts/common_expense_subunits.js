$(document).on('turbolinks:load', function() {
    $('#water_field').bind('input', function() {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#gas_field').bind('input', function() {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#electricity_field').bind('input', function() {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#others_field').bind('input', function() {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#salary_field').bind('input', function() {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
    $('#maintenance_field').bind('input', function() {
        $('#total_field').val(parseInt($('#water_field').val() || 0) + parseInt($('#gas_field').val() || 0) + parseInt($('#electricity_field').val() || 0) + parseInt($('#maintenance_field').val() || 0) + parseInt($('#salary_field').val() || 0) + parseInt($('#others_field').val() || 0))
    });
});

$(document).on('turbolinks:load', function() {
    $('#common_expense_subunit_period_1i').on("input change", function() {
        var year = $('#common_expense_subunit_period_1i').val();
        var month = $('#common_expense_subunit_period_2i').val();
        $.ajax({
            url: '/common_expense_subunits/check_if_common_expense_property_for_period_is_issued',
            type: 'GET',
            data: {
                year: year,
                month: month
            }
        });
    });
});

$(document).on('turbolinks:load', function() {
    $('#common_expense_subunit_period_2i').on("input change", function() {
        var year = $('#common_expense_subunit_period_1i').val();
        var month = $('#common_expense_subunit_period_2i').val();
        $.ajax({
            url: '/common_expense_subunits/check_if_common_expense_property_for_period_is_issued',
            type: 'GET',
            data: {
                year: year,
                month: month
            }
        });
    });
});
