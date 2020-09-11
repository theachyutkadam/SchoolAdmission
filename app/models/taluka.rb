class Taluka < ApplicationRecord
  belongs_to :district
  has_many :addresses, as: :addressable
end
