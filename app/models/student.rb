class Student < ApplicationRecord
  belongs_to :state
  belongs_to :district
  belongs_to :taluka

  validates :first_name,
            :middle_name,
            :last_name,
            :mother_name,
            :date_of_birth,
            :aadhaar_card_number,
            presence: true
  validates :aadhaar_card_number, numericality: true, uniqueness: true, length: { is: 12 }
end
