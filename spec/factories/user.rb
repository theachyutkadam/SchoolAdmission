FactoryBot.define do
  factory :user do
    username { "username" }
    password { "123456" }
    association :role
  end
end