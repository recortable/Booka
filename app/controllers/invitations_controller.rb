class InvitationsController < ApplicationController
  respond_to :html

  expose(:email) { params[:email]}
  expose(:user) do
    user = User.find_by_email(email)
    unless user
      name = email.split('@')[0]
      user = User.create(:name => name, :email => email)
    end
    user
  end


  def create
    UserMailer.invitation_email(user).deliver
  end

end
