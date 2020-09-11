FactoryBot.define do
  factory :user do
    username { 'student' }
    password { '123456' }

    for_student # default to the :for_student trait if none is specified

    trait :for_student do
      association :login, factory: :student
    end

    trait :for_teacher do
      association :login, factory: :teacher
    end

  end
end
