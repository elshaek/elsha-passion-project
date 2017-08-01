require 'bcrypt'

class User < ActiveRecord::Base


  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by({email: email})
    if user.password == password
      return true 
    else
    false
  end

end
