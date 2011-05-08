class SessionsController < ApplicationController

  def enter
    self.current_user = User.find params[:id]
    redirect_to stored_or(root_path)
  end

end
