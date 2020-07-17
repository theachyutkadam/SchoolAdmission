class Teacher < ApplicationRecord
  has_one :classroom
  validates :gender, inclusion: %w(male female transgender)
  validates :first_name, :middle_name, :last_name, :mother_name, :date_of_birth, :date_of_join, :gender, presence: true
  validates :contact, presence: true, numericality: true, length: {in: 10..15}
  validates :is_active, acceptance: true
end
