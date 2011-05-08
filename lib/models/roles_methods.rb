module Models
  module RolesMethods

    def admin?
      /admin/ =~ roles
    end
  end
end