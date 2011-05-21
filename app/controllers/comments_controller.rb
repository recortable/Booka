class CommentsController < ApplicationController
  respond_to :html, :js
  expose(:comment)
  expose(:resource) { comment.resource }

  def new
    if params[:parent_id].present?
      comment.parent = Comment.find(params[:parent_id])
      comment.resource = comment.parent.resource
    end
    respond_with comment
  end

  def create
    comment.user = current_user ? current_user : User.find(2)
    comment.project = comment.resource_type == 'Project' ? resource : resource.project
    authorize! :create, comment
    flash[:notice] = t('comments.notice.create') if comment.save
    respond_with comment, :location => comment.locate_resource
  end
end
