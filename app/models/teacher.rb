class Teacher < ApplicationRecord
  has_one :classroom
  has_one :user, as: :login
  # validates :gender, inclusion: %w[male female transgender]
  validates :first_name, :middle_name, :last_name, :mother_name, :date_of_birth, :date_of_join, :gender, presence: true
  validates :contact, presence: true, uniqueness: true, numericality: true, length: { in: 10..15 }
  validates :is_active, acceptance: true

  after_create :create_user

  private
  def create_user
    role = Role.find_by(name: "Teacher").id
    User.create(
                username: "#{self.last_name+'_'+self.contact.last(4)}",
                password:"123456",
                role_id: role,
                login: self
              )
  end

end