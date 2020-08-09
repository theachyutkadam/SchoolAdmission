class Teacher < ApplicationRecord
  has_one :classroom
  validates :gender, inclusion: %w[male female transgender]
  validates :first_name, :middle_name, :last_name, :mother_name, :date_of_birth, :date_of_join, :gender, presence: true
  validates :contact, presence: true, uniqueness: true, numericality: true, length: { in: 10..15 }
  validates :is_active, acceptance: true

  # validate :validate_dates
  # def validate_dates
  #   if date_of_birth < Date.current - 18.year
  #     errors.add(:base, "Teacher should be 18+")
  #   elsif date_of_join <= Date.current
  #     errors.add(:base, "Date should be less than Today")
  #   end
  # end
end
