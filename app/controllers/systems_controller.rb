class SystemsController < ApplicationController
  respond_to :html
  expose(:new_notifications_count) { Notification.update_notifications }
  expose(:notifications_count) { Notification.count }

  def show
  end
end
