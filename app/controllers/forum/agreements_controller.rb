class Forum::AgreementsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get params[:project_id] }
  expose(:topic) { project.topics.find params[:topic_id] }
  expose(:agreements) { topic.agreements }
  expose(:agreement)

  def new
    authorize! :manage, project
    agreement.project = project
  end

  def edit
    authorize! :edit, agreement
  end

  def create
    build_params(params[:agreement], current_user)
    agreement.project = project
    authorize! :create, agreement
    flash[:notice] = t('agreements.notice.create') if agreement.save
    respond_with agreement, :location => [project, topic]
  end
  
  def update
    authorize! :update, agreement
    flash[:notice] = t('agreements.notice.update') if agreement.update_attributes(params[:agreement])
    respond_with agreement, :location => [project, topic]
  end

  def destroy
    authorize! :destroy, agreement
    flash[:notice] = t('agreements.notice.destroy') if agreement.destroy
    respond_with agreement, :location => [project, topic]
  end
end
