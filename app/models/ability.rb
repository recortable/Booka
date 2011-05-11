class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.anonymous
    can :manage, :all if user.admin?
    can :read, :all
    cannot :read, User if user.anonymous?

    can :create, Comment

    can :manage, user do |u|
      user == u
    end
  end
end