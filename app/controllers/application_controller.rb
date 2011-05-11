# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include Controllers::AuthMethods

  helper_method :current_user, :signed_in?
  helper_method :project?, :default_layout?
  helper_method :logo

  rescue_from ActionView::TemplateError do |x|
    #bubble up the original exception
    #ActiveRecord::RecordNotFound
    raise x.original_exception
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => 'No tienes permisos suficientes para acceder a esa página'
  end

  protected
  def logo
    '/assets/iconos/libro.png'
  end

  def default_layout?
    self.class != ContentsController
  end

  def project?
    self.respond_to?(:project) and self.project.present?
  end
end
