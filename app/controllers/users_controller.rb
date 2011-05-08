class UsersController < ApplicationController
  respond_to :html
  expose(:users) { User.all }
  expose(:user)

  def index
    authorize! :read, User
  end

  def show
    authorize! :read, user
  end
end
