class Classroom < ApplicationRecord
  belongs_to :teacher
  belongs_to :standard
  validates :medium, presence: true
  validates :division, presence: true
end