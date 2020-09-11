class Address < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :taluka
  belongs_to :addressable, polymorphic: true
  validates :pincode, presence: true, numericality: true, uniqueness: true, length: { is: 6 }
end
