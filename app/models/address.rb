class Address < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :taluka
  belongs_to :user
  validates :pincode, presence: true, numericality: true, length: { is: 6 }
end
