# Notifications

config = {
    markClass: 'new-notification'
}

add_notification_count = (n) ->
    value = parseInt($("#new-notification-count").html()) + n
    $("#new-notification-count").html("" + value)

update_notification = (href, value) ->
    $.post(href + ".json", {
        '_method' : 'put',
        'notification[should_be_emailed]': value
    });

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

    $("a.mark-as-unreaded").live 'click', ->
        n = $(this).parents('.notification')
        if !n.hasClass(config.markClass)
            n.addClass(config.markClass)
            add_notification_count(1)
            update_notification($(this).attr('href'), '1')
        false;

    $("a.mark-as-readed").live 'click', ->
        n = $(this).parents('.notification')
        if n.hasClass(config.markClass)
            n.removeClass(config.markClass)
            add_notification_count(-1)
            update_notification($(this).attr('href'), '0')
        false;
    true