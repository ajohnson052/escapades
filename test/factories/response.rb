FactoryGirl.define do
  factory :response do
    user
    escapade
    comment "Comment"

    trait :with_availability do
      after(:create) do |response|
        response.availabilities << create(:availability)
      end
    end

  end
end
