
# INDEX

indexList = '#carte_books_content_editor .index'
indexListItems = '#carte_books_content_editor ul.index li'
indexOutput = '#carte_book_contents'

updateBody = ->
  body = []
  $(indexListItems).each ->
    console.log 'joe'
    body.push "#{$(this).attr('class')}[#{$(this).data('id')}]:#{$(this).text()}"
  output = body.join('\n')
  console.log(output)
  $(indexOutput).val(output)

# CONTENTS

searchDiv = '#contents_search'
searchField = "#{searchDiv} input[type=text]"
searchInfo = "#{searchDiv} div.info"
searchResults = "#{searchDiv} ul.results"


tmplSearchResult = (item) ->
  "<li id='content-#{item.id}' class='content'
  data-id='#{item.id}' data-title='#{item.title}'>
  <h3>#{item.title}</h3>
  <div class='author'>#{item.author}</div>
  <a href='#' class='add-to-book'>añadir</a>
  </li>"

tmplContent = (item) ->
  "<li class='content'
  data-id='#{item.id}'>#{item.title}</li>"

searchContents = ->
  url = $('#contents_search').data('search-url')
  term = $(searchField).val()
  if term.length > 0
    $(searchInfo).text("Buscando '#{term}'...")
    $.getJSON url, {term: term}, (data) ->
      $(searchInfo).text('')
      rendered = (tmplSearchResult(item) for item in data).join('')
      $(searchResults).html(rendered)


addContent = ->
  id = $(this).parent().data('id')
  title = $(this).parent().data('title')
  $(indexList).append(tmplContent({id: id, title: title}))
  updateBody()
  false

# SECTIONS

addSectionField = '#add-section input[type=text]'

tmplSection = (name) ->
  "<li class='section' data-id=''>#{name}</li>"

addSection = ->
  term = $(addSectionField).val()
  $(indexList).append(tmplSection(term))
  $(addSectionField).val('').focus()
  updateBody()


# RENDER
parseRegexp = /(\w+)\[(\w*)\]:(.*)/
renderIndex = ->
  raw = $(this).text()
  console.log "RAW", raw
  out = ''
  $.each raw.split('\n'), ->
    match = parseRegexp.exec(this)
    out += "<li class='#{match[1]}'>#{match[3]}</li>"
  list = $(this).parent().find('ul.index')
  list.html(out)

jQuery ->
  $(searchField).change(searchContents)
  $(addSectionField).change(addSection)
  $('a.add-to-book').live('click', addContent)
  $(indexList).sortable {axis: 'y', update: updateBody}
  $('.carte_book .raw').each(renderIndex)

