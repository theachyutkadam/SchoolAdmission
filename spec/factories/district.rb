FactoryBot.define do
  factory :district do
    name { 'district' }
    association :state
  end
end
