class Classroom < ApplicationRecord
  belongs_to :teacher
  belongs_to :standard
  validates :medium, :division, presence: true
end