# Comments.js

$ ->
  $("div.comment a.reply").live 'click', ->
    href = $(this).attr('href')
    $.getScript(href + ".js")
    false