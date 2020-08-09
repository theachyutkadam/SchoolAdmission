FactoryBot.define do
  factory :user do
    username { 'teacher' }
    password { '123456' }
    association :role
  end
end
