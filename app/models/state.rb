class State < ApplicationRecord
  belongs_to :country
  has_many :districts
  has_many :addresses, as: :addressable
end
