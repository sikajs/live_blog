class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  scope :recent, -> { order("created_at DESC") }

end
