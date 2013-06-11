require 'BCrypt'

class User < ActiveRecord::Base

  attr_accessible :username, :password

  validates_presence_of :username

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
