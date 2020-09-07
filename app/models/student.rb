class Student < ApplicationRecord
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

  after_create :create_user

  private
  def create_user
    role = Role.find_by(name: "Student").id
    User.create(
                username: "#{self.last_name+'_'+self.aadhaar_card_number.last(4)}",
                role_id: role,
                password: "123456",
                login: self
    )
  end

end