class TopicsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:topics) { project.topics }
  expose(:topic)
  expose(:new_comment) { Comment.new(:resource => topic)}
  expose(:responses) { topic.responses }
  expose(:proposals) { params[:id].present? ? responses.select {|r| r.type == 'Proposal' } : project.responses.proposals }
  expose(:agreements) { params[:id].present? ? responses.select {|r| r.type == 'Agreement' } : project.responses.agreements }
  expose(:tasks) { params[:id].present? ? responses.select {|r| r.type == 'Task' } : project.responses.tasks }

  def index
    authorize! :read, Topic
  end

  def new
    topic.content_type = 'text/markdown'
    authorize! :manage, project
  end

  def edit
    authorize! :edit, topic
  end

  def show
    authorize! :read, topic
  end

  def create
    topic.user = current_user
    authorize! :create, topic
    flash[:notice] = t('topics.notice.create') if topic.save
    respond_with topic, :location => [project, topic]
  end

  def update
    authorize! :update, topic
    flash[:notice] = t('topics.notice.update') if topic.save
    respond_with topic, :location => [project, topic]
  end
end
