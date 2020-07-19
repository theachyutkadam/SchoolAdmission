FactoryBot.define do
  factory :taluka do
    name { "taluka" }
    association :district
  end
end