

searchField = '#contents_search input[type=text]' 

searchContents = ->
  url = $('#contents_search').data('search-url')
  term = $(searchField).val()  
  $.get url, {term: term}, (data) ->
    $("ul#contents").html(data)


jQuery ->
  $(searchField).change(searchContents)