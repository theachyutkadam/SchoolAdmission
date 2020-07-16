class Teacher < ApplicationRecord
  has_one :classroom
  # enum gender: [:male, :female, :transgender]
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
end
