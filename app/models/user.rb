class User < ApplicationRecord
  belongs_to :role
  belongs_to :login, polymorphic: true
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate(username, password)
    User.find_by(username: username, password: password)
  end
end
