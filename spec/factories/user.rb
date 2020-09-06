FactoryBot.define do
  factory :user do
    username { 'teacher' }
    password { '123456' }
    association :role

    for_student # default to the :for_photo trait if none is specified

    trait :for_student do
      association :login, factory: :student
    end

    trait :for_teacher do
      association :login, factory: :teacher
    end

  end
end
