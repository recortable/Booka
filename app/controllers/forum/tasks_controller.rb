class Forum::TasksController < ApplicationController
  respond_to :html
  expose(:project) { Project.get params[:project_id] }
  expose(:topic) { project.topics.find params[:topic_id] }
  expose(:tasks) { topic.tasks }
  expose(:task)

  def new
    authorize! :manage, project
    task.project = project
  end

  def edit
    authorize! :edit, task
  end

  def create
    build_params(params[:task], current_user)
    task.project = project
    authorize! :create, task
    flash[:notice] = t('tasks.notice.create') if task.save
    respond_with task, :location => [project, topic]
  end
  
  def update
    authorize! :update, task
    flash[:notice] = t('tasks.notice.update') if task.update_attributes(params[:task])
    respond_with task, :location => [project, topic]
  end

  def destroy
    authorize! :destroy, task
    flash[:notice] = t('tasks.notice.destroy') if task.destroy
    respond_with task, :location => [project, topic]
  end
end
