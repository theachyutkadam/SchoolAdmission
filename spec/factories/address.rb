FactoryBot.define do
  factory :address do
    pincode { '111111' }
    association :country
    association :state
    association :district
    association :taluka
    association :user
  end
end