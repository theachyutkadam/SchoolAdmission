class Student < ApplicationRecord
  belongs_to :state
  belongs_to :district
  belongs_to :taluka
end
