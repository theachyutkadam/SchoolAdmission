class User < ApplicationRecord
  belongs_to :role
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate provided_username, provided_password
    user = User.find_by(username: provided_username, password: provided_password)
    if user
      return true
    else
      return false
    end
  end
end
