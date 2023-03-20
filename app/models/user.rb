class User < ApplicationRecord
  has_many :articles

  def password
    BCrypt::Password.new(encrypted_password)
  end

  def password=(password)
    self.encrypted_password = BCrypt::Password.create(password)
  end
end
