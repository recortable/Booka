module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), :class => "nested-comments")
    end.join.html_safe
  end
end
