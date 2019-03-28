class User < ApplicationRecord
  validates_presence_of :user_name, :email_address, :password
  validates :email_address, uniqueness: true

  def self.authenticate(email, password)
    find_by(email_address: email, password: password)
  end

end
