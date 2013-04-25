class Comment < ActiveRecord::Base
  attr_accessible :content, :image_id, :user_id
  belongs_to :image
  belongs_to :user
end