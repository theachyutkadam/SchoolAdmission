FactoryBot.define do
  factory :attendance do
    is_present true
    association :student
    association :teacher
  end
end