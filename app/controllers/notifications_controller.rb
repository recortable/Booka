class NotificationsController < ApplicationController
  respond_to :js, :json
  expose(:user) { User.find(params[:user_id]) }
  expose(:notifications) { user.notifications.page(params[:page]) }
  expose(:notification)

  def index
  end

  def update
    puts params[:notification]
    notification.update_attributes(params[:notification])
    respond_with notification
  end
end
