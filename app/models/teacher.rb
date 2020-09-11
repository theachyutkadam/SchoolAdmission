class Teacher < ApplicationRecord
  has_one :classroom
  has_one :user, as: :login
  has_one :attendance
  has_many :addresses

  validates :gender, inclusion: %w[male female transgender]
  validates :first_name, :middle_name, :last_name, :mother_name, :date_of_birth, :date_of_join, :gender, presence: true
  validates :contact, presence: true, uniqueness: true, numericality: true, length: { in: 10..15 }
  validates :is_active, acceptance: true

  after_create :create_user

  private

  def create_user
    User.create(
      username: (last_name + '_' + contact.last(4)).to_s,
      password: '123456',
      login: self
    )
  end
end
