class State < ApplicationRecord
  belongs_to :country
  has_many :districts
  has_one :student
end