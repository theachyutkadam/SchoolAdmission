FactoryBot.define do
  factory :state do
    name { "state" }
    association :country
  end
end