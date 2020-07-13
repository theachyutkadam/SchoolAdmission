FactoryBot.define do
  factory :user do
    username { "username" }
    password { "password" }
    association :role
  end
end