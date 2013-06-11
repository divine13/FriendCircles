require 'BCrypt'

class User < ActiveRecord::Base

  attr_accessible :username, :password, :posts_attributes

  validates_presence_of :username

  has_many :friend_circles, foreign_key: :creator_id
  has_many :friends, through: :friend_circles

  has_many :friendships, foreign_key: :friend_id
  has_many :within_circles, through: :friendships, source: :friend_circle
  has_many :feed_shares, through: :within_circles, source: :post_shares
  has_many :feed_posts, through: :feed_shares, source: :post


  has_many :posts, foreign_key: :author_id

  accepts_nested_attributes_for :posts


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def validate_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def set_session_token!
    self.session_token = SecureRandom.base64(16)

    self.save!

    self.session_token
  end

end
