# Notifications
$ ->
    $("div#notifications .more a").click ->
        page = $(this).parent().data('page') + 1
        $(this).parent().data('page', page)
        $.ajax({
            url: $(this).attr('href'),
            data: {page : page},
            dataType: 'script'
        });
        false