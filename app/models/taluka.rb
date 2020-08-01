class Taluka < ApplicationRecord
  belongs_to :district
  has_one :student
end
