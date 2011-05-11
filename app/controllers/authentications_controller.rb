class AuthenticationsController < ApplicationController
  respond_to :html
  expose(:user) { User.find params[:user_id] }
  expose(:authentications) { user.authentications }
  expose(:authentication)

  def index
    authorize! :manage, user
  end

  def destroy
    authorize! :manage, user
    flash[:notice] = t('authentications.notice.destroy') if authentication.destroy
    redirect_to user_authentications_path(user)
  end
end
