class NotificationsController < ApplicationController
  respond_to :js, :json
  expose(:user) { User.find(params[:user_id]) }
  expose(:notifications) { user.notifications.page(params[:page]) }
  expose(:notification)

  def index
  end

  def update
    notification.update_attributes(params[:notification])
    respond_with notification
  end

  def clear
    authorize! :manage, user
    user.unreaded_notifications.each do |notification|
      notification.mark_as_mailed
    end
    redirect_to user
  end
end
