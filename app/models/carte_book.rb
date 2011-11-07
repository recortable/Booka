# CarteBook
#
#  t.integer  "user_id"
#  t.string   "title",      :limit => 300
#  t.string   "subtitle",   :limit => 500
#  t.string   "editor",     :limit => 300
#  t.string   "place",      :limit => 200
#  t.date     "pub_date"
#  t.text     "contents"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#
class CarteBook < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :editor, presence: true

  PARSE_RX = /(\w+)\[(\w*)\]:(.*)/

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def index
    return @index if @index
    @index = []
    contents.each_line do |line|
      line.scan(PARSE_RX) do |type, id, title|
        index << {type: type, id: id, title: title}
      end
    end
    @index
  end
end
