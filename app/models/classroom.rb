class Classroom < ApplicationRecord
  has_many :students
  belongs_to :teacher
  belongs_to :standard
  validates :medium, :division, :intake, presence: true
  validates :intake, numericality: true
end
