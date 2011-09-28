class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.anonymous

    can :read, :all
    can :manage, :all if user.admin?

    cannot :read, User if user.anonymous?

    can :manage, Content do |content|
      permission = user.permissions.where(project_id: content.project_id).first
      permission.present? and permission.level == 'admin'
    end

    can :create, Comment

    can :manage, user do |u|
      user == u
    end
  end
end