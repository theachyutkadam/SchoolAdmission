class District < ApplicationRecord
  belongs_to :state
  has_many :talukas
end
