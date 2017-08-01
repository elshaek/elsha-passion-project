require 'bcrypt'

class User < ActiveRecord::Base
  validates :check_password_input, on: :create

  def check_password_input
    if @plain_text.empty?
      errors.add(:hashed_password, "invalid password")
    end
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @plain_text = new_password
    @password = BCrypt::Password.create(@plain_text)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by({email: email})
    if user.password == password
      return user 
    else
      false
    end
  end
end
