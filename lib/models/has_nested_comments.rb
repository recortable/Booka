module Models
  module HasNestedComments
    def has_nested_comments
      has_many :comments, :as => :resource, :order => 'id DESC', :conditions => {:ancestry => nil}
    end
  end
end