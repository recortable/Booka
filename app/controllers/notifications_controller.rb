class NotificationsController < ApplicationController
  respond_to :js
  expose(:user) { User.find(params[:user_id]) }
  expose(:notifications) { user.notifications.page(params[:page]) }

  def index
  end
end
