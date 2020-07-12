class Role < ApplicationRecord
  validates :name, presence: true
end