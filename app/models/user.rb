require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  
  validates :email, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)#Create a session (signin)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end