class ProposalsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get params[:project_id] }
  expose(:topic) { project.topics.find params[:topic_id] }
  expose(:proposals) { topic.proposals }
  expose(:proposal)

  def new
    authorize! :manage, project
    proposal.project = project
  end

  def edit
    authorize! :edit, proposal
  end

  def create
    build_params(params[:proposal], current_user)
    proposal.project = project
    authorize! :create, proposal
    flash[:notice] = t('proposals.notice.create') if proposal.save
    respond_with proposal, :location => [project, topic]
  end
  
  def update
    authorize! :update, proposal
    flash[:notice] = t('proposals.notice.update') if proposal.update_attributes(params[:proposal])
    respond_with proposal, :location => [project, topic]
  end

  def destroy
    authorize! :destroy, proposal
    flash[:notice] = t('proposals.notice.destroy') if proposal.destroy
    respond_with proposal, :location => [project, topic]
  end
end
