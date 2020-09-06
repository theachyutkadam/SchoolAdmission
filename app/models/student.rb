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

  # before_create :create_user

  # private

  # def create_user
  #   role = Role.find_by(name: "Teacher")
  #   User.create(username: "#{self.last_name+'_'+rand.(1111..9999)}", role_id: role, password: "123456")
  # end

end