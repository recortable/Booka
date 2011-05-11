class UsersController < ApplicationController
  respond_to :html
  expose(:users) { User.all }
  expose(:user)

  def index
    authorize! :read, User
  end

  def show
    authorize! :read, user
  end

  def edit
    authorize! :edit, user
  end

  def update
    authorize! :update, user
    flash[:notice] = t('users.notice.update') if user.update_attributes(params[:user])
    respond_with user
  end

  def email_notifications
    UserMailer.notification_email(user).deliver
    flash[:notice] = t('users.notice.email_notifications')
    redirect_to user
  end
end
