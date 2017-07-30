require 'bcrypt'

class User < ActiveRecord::Base


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by({email: email})
    if user.password == password
      return true 
    else
    false
  end

end
