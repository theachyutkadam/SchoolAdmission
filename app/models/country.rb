class Country < ApplicationRecord
  has_many :states
  has_many :addresses, as: :addressable
end
