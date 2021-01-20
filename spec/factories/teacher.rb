FactoryBot.define do
  factory :teacher do
    first_name { 'rajesh' }
    middle_name { 'vikas' }
    last_name { 'kale' }
    mother_name { 'anita' }
    date_of_birth { Date.current - 28.year }
    date_of_join { Date.current - 5.year }
    gender { 'male' }
    aadhaar_card_number { '111111111111' }
    education { 'M.C.A' }
    speciality { 'Programming' }
    contact { SecureRandom.random_number(1_111_111_111..9_999_999_999).to_s }
    alternate_contact { '9879879871' }
    address { 'at- saykhindi, tal- sangamner, dist- ahemadnagar' }
    is_active { true }
  end
end
