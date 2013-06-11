class Friendship < ActiveRecord::Base
  attr_accessible :friend_circle_id, :friend_id

  belongs_to :friend, class_name: 'User'
  belongs_to :friend_circle

end
