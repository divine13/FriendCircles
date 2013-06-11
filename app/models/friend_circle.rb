class FriendCircle < ActiveRecord::Base
  attr_accessible :category_name, :creator_id,
                  :friendships_attributes, :friend_ids

  belongs_to :creator, class_name: 'User'
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :post_shares

  accepts_nested_attributes_for :friendships

end
