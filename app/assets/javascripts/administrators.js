    $(document).on('turbolinks:load', function() {
        $(".prevent-charge-to-subunit").click(function() {
            var idToDestroy = $(this).attr('div-id');
            $("#" + idToDestroy).replaceWith("<h3>SUBUNIDAD ELIMINADA</h3>");
        })
    });
