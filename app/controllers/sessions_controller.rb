# encoding: utf-8

class SessionsController < ApplicationController
  protect_from_forgery :except => :create

  def new
    store_location(params[:from])
  end

  def create
    omni = request.env['omniauth.auth']
    if omni.present?
      user_id = session[:invited_user_id]
      user_id ||= session[:user_id]

      puts "CREATE WITH #{user_id} - #{omni}"

      if user_id.present?
        puts 'User id present: creating new authentication'
        login User.find user_id
        current_user.authentications.find_or_create_by_provider_and_uid(omni['provider'], omni['uid'])
        flash[:notice] = t('sessions.notice.new_user')
        redirect_to stored_or(root_path)
      elsif auth = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
        puts 'Authentication found: login.'
        login auth.user
        flash[:notice] = t('sessions.notice.create')
        redirect_to stored_or(root_path)
      elsif omni['user_info'].present? and omni['user_info']['email'].present? and user = User.find_by_email(omni['user_info']['email'])
        puts 'User email found: adding authentication'
        login user
        current_user.authentications.find_or_create_by_provider_and_uid(omni['provider'], omni['uid'])
        flash[:notice] = t('sessions.notice.create')
        redirect_to stored_or(root_path)
      else
        puts "No user found!"
      end
    end
    @auth = omni
  end

  def destroy
    self.clear_user
    redirect_to root_path
  end

  def enter
    self.current_user = User.find params[:id]
    redirect_to stored_or(root_path)
  end

  protected
  def login(user)
    self.current_user = user
    login_count = user.login_count + 1
    user.update_attributes login_count: login_count, last_login_at: Time.now
  end

end
