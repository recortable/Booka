module ResponsesHelper
  def render_responses(responses)
    output = ""
    responses.each do |model|
      output << render(:partial => 'responses/response', :locals => {:resp => model})
    end
    output.html_safe
  end
end
