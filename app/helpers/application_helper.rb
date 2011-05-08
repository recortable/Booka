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
    elsif model.content_type == 'text/html'
      content_tag :div, model.body.html_safe, :class => 'body'
    else
      content_tag :div, model.body, :class => 'body'
    end
  end

end
