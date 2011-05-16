class AssetsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:assets) { project.assets }
  expose(:asset)

  def new
    authorize! :manage, project
    asset.resource = Content.find(params[:c]) if params[:c]
  end

  def create
    asset.user = current_user
    asset.project = project
    authorize! :create, asset
    flash[:notice] = t('assets.notice.create') if asset.save
    respond_with asset, :location => [project, asset.resource]
  end
end
