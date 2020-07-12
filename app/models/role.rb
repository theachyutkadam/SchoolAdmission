class Role < ApplicationRecord
  validates :name, presence: true

  def student?
    name == "student"
  end
end