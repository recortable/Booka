# encoding: utf-8


module ApplicationHelper
  def title(text)
    content_for(:title) { text }
    content_tag(:h1, text)
  end

  def render_body(model, wrap_with_div = true)
    return if model.blank?

    body = if model.body.blank?
             title = model.respond_to?(:title) ? model.title : 'esta página'
             "<De momento '#{title}' no tiene contenido>"
           elsif model.content_type == 'text/markdown'
             options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
             Redcarpet.new(model.body, *options).to_html.html_safe
           elsif model.content_type == 'text/html'
             model.body.html_safe
           else
             model.body
           end

    wrap_with_div ? content_tag(:div, body, :class => 'body') : body
  end

  def submit(location, cancel_location)
    model = location.is_a?(Array) ? location.last : location
    label = model.new_record? ? 'Crear' : 'Actualizar'
    url = model.new_record? ? cancel_location : location
    button_submit_tag(label) + link_to('Cancelar', url, :class => 'cancel')
  end

  # Translate categories
  # Translate an array to render a select box
  def tc(prefix, list)
    list.map do |item|
      [I18n.t("#{prefix}.#{item}"), item]
    end
  end

end
