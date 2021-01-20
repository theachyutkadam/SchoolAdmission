class Taluka < ApplicationRecord
  belongs_to :district
  has_many :addresses
end
