class AssetsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:content) { params[:content_id].present? ? Content.find(params[:content_id]) : nil }
  expose(:resource) { content ? content : project }
  expose(:assets) { resource.assets }
  expose(:asset)
  
  def index
    
  end

  def show
    url = asset.resource ? [project, asset.resource, :assets] : [project, :assets]
    redirect_to url
  end

  def new
    authorize! :manage, project
    asset.resource = Content.find(params[:c]) if params[:c]
  end

  def edit
    authorize! :edit, asset
  end

  def create
    asset.user = current_user
    asset.project = project
    authorize! :create, asset
    flash[:notice] = t('assets.notice.create') if asset.save
    respond_with asset, :location => [project, asset.resource]
  end

  def update
    authorize! :update, asset
    flash[:notice] = t('assets.notice.update') if asset.update_attributes(params[:asset])
    respond_with asset, :location => [project, asset]
  end

  def destroy
    authorize! :destroy, asset
    flash[:notice] = t('assets.notice.destroy') if asset.destroy
    location = asset.resource ? [project, asset.resource, :assets] : [project, :assets]
    respond_with asset, :location => location
  end
end
