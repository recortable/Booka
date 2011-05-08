class PostsController < ApplicationController
  respond_to :html
  expose(:project) { Project.find_by_slug(params[:project_id])}
  expose(:posts) { project.posts }
  expose(:post)
  expose(:new_comment) { Comment.new(:resource => post) }

  def show
    authorize! :read, post
  end
end
