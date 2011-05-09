class CommentsController < ApplicationController
  respond_to :html
  expose(:comment)
  expose(:resource) { comment.resource }

  def new

  end

  def create
    comment.user = current_user ? current_user : User.find(2)
    comment.project = comment.resource_type == 'Project' ? resource : resource.project
    authorize! :create, comment
    flash[:notice] = t('comments.notice.create') if comment.save
    location = comment.project == comment.resource ? comment.project : [comment.project, comment.resource]
    respond_with comment, :location => location
  end
end
