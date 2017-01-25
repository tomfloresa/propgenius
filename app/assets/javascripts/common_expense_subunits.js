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
