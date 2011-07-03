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
        self.current_user = User.find user_id
        current_user.authentications.find_or_create_by_provider_and_uid(omni['provider'], omni['uid'])
        flash[:notice] = t('sessions.notice.new_user')
        redirect_to stored_or(root_path)
      elsif auth = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
        puts 'Authentication found: login.'
        self.current_user = auth.user
        flash[:notice] = t('sessions.notice.create')
        redirect_to stored_or(root_path)
      elsif omni['user_info'].present? and omni['user_info']['email'].present? and user = User.find_by_email(omni['user_info']['email'])
        puts 'User email found: adding authentication'
        self.current_user = user
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


end
