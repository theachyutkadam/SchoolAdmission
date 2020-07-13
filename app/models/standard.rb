class Standard < ApplicationRecord
  validates :name, presence: true
  has_many :classrooms
end
