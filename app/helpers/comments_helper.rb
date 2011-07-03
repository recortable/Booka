module CommentsHelper
  def render_comments(new_comment, options = {})
    options = {:social => true}.merge options
    render :partial => 'comments/comments', :locals => {:comment => new_comment, :social => options[:social]}
  end


  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), :class => "nested-comments")
    end.join.html_safe
  end
end
