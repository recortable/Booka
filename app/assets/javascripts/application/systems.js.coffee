checkSystem = ->
    $.getJSON '/system.json', (data) ->
        $("#user_notifications").text(data.user_notifications).show();
        setTimeout(checkSystem, 1000 * 60)

#$ ->
    #setTimeout(checkSystem, 500)