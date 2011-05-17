class InvitationsController < ApplicationController
  respond_to :html

  expose(:email) { params[:email]}

  expose(:emailed_user) do
    user = User.find_by_email(email)
    unless user
      name = email.split('@')[0]
      user = User.create(:name => name, :email => email)
    end
    user
  end

  expose(:invited_user) do
    user = User.find params[:id]
    user.generate_code == params[:code] ? user : nil
    user
  end


  def show
    session[:invited_user_id] = invited_user.id
  end

  def create
    UserMailer.invitation_email(emailed_user).deliver
  end

end
