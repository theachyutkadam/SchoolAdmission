class Student < ApplicationRecord
  belongs_to :standard
  belongs_to :classroom
  has_one :attendance
  has_one :user, as: :login

  validates :first_name,
            :middle_name,
            :last_name,
            :mother_name,
            :date_of_birth,
            :aadhaar_card_number,
            presence: true
  validates :aadhaar_card_number, numericality: true, uniqueness: true, length: { is: 12 }
  belongs_to :standard
  belongs_to :classroom
  has_one :user, as: :login
  has_many :addresses, as: :addressable

  after_create :create_user

  private

  def create_user
    User.create(
      username: (last_name + '_' + aadhaar_card_number.last(4)).to_s,
      password: '123456',
      login: self
    )
  end
end
