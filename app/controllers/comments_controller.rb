class CommentsController < ApplicationController
  respond_to :html
  expose(:comment)
  expose(:resource) { comment.resource }

  def new

  end

  def create
    comment.user = current_user
    comment.project = resource.project
    authorize! :create, comment
    flash[:notice] = t('comments.notice.create') if comment.save
    respond_with comment, :location => [comment.resource.project, comment.resource]
  end
end
