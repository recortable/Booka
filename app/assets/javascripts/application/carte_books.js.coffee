# INDEX

indexList = '#carte_books_content_editor .index'
indexListItems = '#carte_books_content_editor ul.index li'
indexOutput = '#carte_book_contents'

updateBody = ->
  body = []
  $(indexListItems).each ->
    body.push "#{$(this).attr('class')}[#{$(this).data('id')}]:#{$(this).data('title')}"
  output = body.join('\n')
  console.log(output)
  $(indexOutput).val(output)

# INDEX ITEMS
deleteAction = '#carte_books_content_editor a.action.delete'

deleteItem = ->
  $(this).parent().remove()
  updateBody()
  false

# CONTENTS

searchDiv = '#contents_search'
searchField = "#{searchDiv} input[type=text]"
searchInfo = "#{searchDiv} div.info"
searchResults = "#{searchDiv} ul.results"

# SEARCH RESULT
tmplSearchResult = (item) ->
  "<li id='content-#{item.id}' class='content'
  data-id='#{item.id}' data-title='#{item.title}'>
  <h3>#{item.title}</h3>
  <div class='author'>#{item.author}</div>
  <a href='#' class='add-to-book'>añadir</a>
  </li>"

# CONTENT AT INDEX
tmplContent = (item) ->
  "<li class='content'
  data-id='#{item.id}' data-title='#{item.title}'>
  #{item.title}
  <a class='action delete' href='#'>borrar</a>
  </li>"

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
  "<li class='section' data-id=''
  data-title='#{name}'>#{name}
  <a class='action delete' href='#'>borrar</a>
  </li>"

addSection = ->
  term = $(addSectionField).val()
  $(indexList).append(tmplSection(term))
  $(addSectionField).val('').focus()
  updateBody()


# RENDER INDEX FROM DATA
parseRegexp = /(\w+)\[(\w*)\]:(.*)/

renderIndexItem = (item) ->
  "<li class='#{item.type}'
  data-id='#{item.id}' data-title='#{item.title}'>
  #{item.title}
  <a class='action delete' href='#'>borrar</a>
  </li>"

renderIndex = ->
  raw = $(this).text()
  console.log "RAW", raw
  out = ''
  $.each raw.split('\n'), ->
    match = parseRegexp.exec(this)
    out += renderIndexItem {type: match[1], id: match[2], title: match[3]}
  list = $(this).parent().find('ul.index')
  list.html(out)

jQuery ->
  $(searchField).change(searchContents)
  $(addSectionField).change(addSection)
  $('a.add-to-book').live('click', addContent)
  $(indexList).sortable {axis: 'y', update: updateBody}
  $('.carte_book .raw').each(renderIndex)
  $(deleteAction).live('click', deleteItem)

