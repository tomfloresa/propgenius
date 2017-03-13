    $(document).on('turbolinks:load', function() {
        $(".prevent-charge-to-subunit").click(function() {
            var idToDestroy = $(this).attr('div-id');
            $("#" + idToDestroy).replaceWith("<h3>SUBUNIDAD ELIMINADA</h3>");
        })
    });

    $(document).on('turbolinks:load', function() {
        if ($('#period_picker_common_expense_property').length) {
            var year = $('#common_expense_property_period_1i').val();
            var month = $('#common_expense_property_period_2i').val();
            var property_id = parseInt($('#property_id_span').html());

            $.ajax({
                url: '/administrators/check_if_common_expense_property_for_period_is_issued',
                type: 'GET',
                data: {
                    year: year,
                    month: month,
                    property_id: property_id
                }
            });
        }
    });

    $(document).on('turbolinks:load', function() {
        $('#common_expense_property_period_1i, #common_expense_property_period_2i').on("input", function() {
            var year = $('#common_expense_property_period_1i').val();
            var month = $('#common_expense_property_period_2i').val();
            var property_id = parseInt($('#property_id_span').html());
            
            $.ajax({
                url: '/administrators/check_if_common_expense_property_for_period_is_issued',
                type: 'GET',
                data: {
                    year: year,
                    month: month,
                    property_id: property_id
                }
            });
        });
    });
