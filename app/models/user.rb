class User < ActiveRecord::Base

  def admin?
    roles == 'admin'
  end
end
