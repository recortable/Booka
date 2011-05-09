# encoding: utf-8


module ApplicationHelper
  def title(text)
    content_for(:title) {text}
    content_tag(:h1, text)
  end

  def render_body(model)
    return if model.blank?
    if model.body.blank?
      title = model.respond_to?(:title) ? model.title :  'esta página'
      content_tag :div, "<De momento '#{title}' no tiene contenido>", :class => 'body'
    elsif model.content_type == 'text/markdown'
      content_tag :div, RDiscount.new(model.body, :smart).to_html.html_safe, :class => 'body'
    elsif model.content_type == 'text/html'
      content_tag :div, model.body.html_safe, :class => 'body'
    else
      content_tag :div, model.body, :class => 'body'
    end
  end

  def submit(location, cancel_location)
    model = location.is_a?(Array) ? location.last : location
    label = model.new_record? ? 'Crear' : 'Actualizar'
    url = model.new_record? ? cancel_location : location
    button_submit_tag(label) + link_to('Cancelar', url, :class => 'cancel')
  end

end
