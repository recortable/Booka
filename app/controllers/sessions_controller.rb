# encoding: utf-8

class SessionsController < ApplicationController
  protect_from_forgery :except => :create

  def new
    store_location(params[:from])
  end

  def create
    auth = request.env['omniauth.auth']
    user_id = session[:invited_user_id]
    user_id ||= session[:user_id]
    if user_id.present?
      self.current_user = User.find user_id
      current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
      flash[:notice] = t('sessions.notice.new_user')
      redirect_to stored_or(root_path)
    elsif auth = Authentication.find_from_auth(auth)
      self.current_user = auth.user
      flash[:notice] = t('sessions.notice.create')
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
