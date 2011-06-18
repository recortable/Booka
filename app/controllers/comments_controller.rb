class CommentsController < ApplicationController
  respond_to :html, :js
  expose(:comments) { Comment.all }
  expose(:comment)
  expose(:resource) { comment.resource }

  def index
    authorize! :show, Comment
  end

  def show
    redirect_to comment.locate_resource
  end

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

    if params[:email].blank? # prevent spam
      authorize! :create, comment
      flash[:notice] = t('comments.notice.create') if comment.save
      respond_with comment, :location => comment.locate_resource
    else
      redirect_to comment.locate_resource
    end
  end

  def destroy
    authorize! :destroy, comment
    flash[:notice] = 'Comentario borrado.' if comment.destroy
    respond_with comment, :location => comment.locate_resource
  end
end
