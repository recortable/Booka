# encoding: utf-8

class PagesController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:pages) { project.pages }
  expose(:page)

  def index
  end

  def show
    authorize! :read, page
  end

  def new
    authorize! :manage, project
  end

  def edit
    authorize! :edit, project
  end

  def create
    clean_body(params[:page])
    params[:page][:user_id] = current_user.id
    params[:page][:content_type] = 'text/markdown'
    params[:page][:body] = Content.find(params[:copy_content_from]).body if params[:copy_content_from].present?
    authorize! :create, page
    flash[:notice] = t('pages.notice.create') if page.save
    respond_with page, :location => [project, page]
  end

  def update
    authorize! :update, page
    clean_body(params[:page])
    flash[:notice] = t('pages.notice.update') if page.update_attributes(params[:page])
    respond_with page, :location => [project, page]
  end

  def destroy
    authorize! :destroy, page
    flash[:notice] = t('pages.notice.destroy') if page.destroy
    respond_with page, :location => [project, :pages]
  end
end
