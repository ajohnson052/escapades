FactoryGirl.define do
  factory :response do
    user
    escapade
    comment "Comment"

    trait :with_availability do
      after(:create) do |availability|
        create(:availability)
      end
    end

  end
end
