FactoryBot.define do
  factory :classroom do
    division { 'A' }
    medium { "marathi" }
    association :standard
    association :teacher
  end
end