class Standard < ApplicationRecord
  has_many :classrooms
  has_many :students
  validates :name, presence: true
end
