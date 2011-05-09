class PostsController < ApplicationController
  respond_to :html
  expose(:project) { Project.find_by_slug(params[:project_id])}
  expose(:posts) { project.posts }
  expose(:post)
  expose(:new_comment) { Comment.new(:resource => post) }

  def show
    authorize! :read, post
  end

  def edit
    authorize! :edit, post
  end

  def update
    authorize! :update, post
    flash[:notice] = t('posts.notice.update') if post.update_attributes(params[:post])
    respond_with post, :location => [project, post]
  end
end
