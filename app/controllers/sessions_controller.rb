# encoding: utf-8

class SessionsController < ApplicationController
  protect_from_forgery :except => :create

  def new
  end

  def create
    if session[:invited_user_id].present?
      self.current_user = User.find session[:invited_user_id]
      session[:invited_user_id] = nil
      auth = request.env['omniauth.auth']
      current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
      flash[:notice] = t('sessions.flash.create')
      redirect_to stored_or(root_path)
    end
  end

  def destroy
    self.clear_user
    redirect_to root_path
  end

  def enter
    self.current_user = User.find params[:id]
    redirect_to stored_or(root_path)
  end


end
