FactoryBot.define do
  factory :address do
    pincode { '111111' }
    association :country
    association :state
    association :district
    association :taluka

    for_student #default select :for_student trait if none is specified
    trait :for_student do
      association :addressable, factory: :student
    end

    trait :for_teacher do
      association :addressable, factory: :teacher
    end
  end
end