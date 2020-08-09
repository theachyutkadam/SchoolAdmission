class Role < ApplicationRecord
  has_many :users
  validates :name, presence: true
  def student?
    name == 'student'
  end
end
