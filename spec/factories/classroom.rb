FactoryBot.define do
  factory :classroom do
    division { 'A' }
    medium { "marathi" }
    intake { 50 }
    association :standard
    association :teacher
  end
end