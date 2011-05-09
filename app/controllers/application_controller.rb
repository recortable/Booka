class ApplicationController < ActionController::Base
  protect_from_forgery
  include Controllers::AuthMethods

  helper_method :current_user, :signed_in?
  helper_method :project?, :default_layout?
  helper_method :logo

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
