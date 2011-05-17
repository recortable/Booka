# encoding: utf-8
class ProjectProposalsController < ApplicationController
  respond_to :html
  before_filter :require_user

  expose(:project) { Project.get params[:project_id] }
  expose(:project_proposals) { project.project_proposals }
  expose(:project_proposal) do
    if params[:id].present?
      project_proposals.find params[:id]
    elsif params[:project_proposal].present?
      project_proposals.build(params[:project_proposal])
    else
      proposal = ProjectProposal.find_by_project_id_and_user_id(project.id, current_user.id)
      proposal ||= ProjectProposal.new(:project => project, :user => current_user)
    end
  end


  def index
    authorize! :manage, project
  end

  def my_proposal
    render :action => 'edit'
  end

  def show
    authorize! :manage, project_proposal
  end

  def edit
    authorize! :edit, project_proposal
  end

  def create
    params[:project_proposal][:user_id] = current_user.id
    flash[:notice] = t('project_proposals.notice.create') if project_proposal.save
    respond_with project_proposal, :location => [project, project_proposal]
  end

  def update
    flash[:notice] = t('project_proposals.notice.update') if project_proposal.update_attributes(params[:project_proposal])
    respond_with project_proposal, :location => [project, project_proposal]
  end
end
