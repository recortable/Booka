class AuthenticationsController < ApplicationController
  respond_to :html
  expose(:user) { User.find params[:user_id] }
  expose(:authentications) { user.authentications }

  def index
    authorize! :manage, user
  end
end
