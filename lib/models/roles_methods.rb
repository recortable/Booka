module Models
  module RolesMethods

    def admin?
      /admin/ =~ roles
    end

    def super?
      /super/ =~ roles
    end

    def anonymous?
      /anonymous/ =~ roles
    end

  end
end