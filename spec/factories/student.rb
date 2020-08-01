FactoryBot.define do
  factory :student do
    first_name {"first_name"}
    middle_name {"middle_name"}
    last_name {"last_name"}
    mother_name {"mother_name"}
    gender {"male"}
    date_of_birth {Date.current - 10.year}
    aadhaar_card_number {"121212121212"}
    standard {"standard"}
    town {"town"}
    is_handicap {false}
    handicap_details {"no details"}
    is_active {true}
    association :state
    association :district
    association :taluka
  end
end