class SystemsController < ApplicationController
  respond_to :json, :html

  expose(:status) { SystemStatus.new(current_user) }

  def show
    #status.send_emails
    respond_with status
  end
end
