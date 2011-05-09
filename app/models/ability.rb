class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all if user.admin?
    can :read, :all

    can :create, Comment

    can :manage, user do |u|
      user = u
    end
  end
end