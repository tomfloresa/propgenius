$(document).on('turbolinks:load', function() {
    if ($('#common_expense_property_period_2i') && $('#common_expense_property_period_1i')) {
        $('#common_expense_property_period_2i').wrap("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'></div>");
        $('#common_expense_property_period_1i').wrap("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'></div>");
    }
});
