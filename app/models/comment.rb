class Comment < ActiveRecord::Base
  belongs_to :image
  has_many :comments
end
