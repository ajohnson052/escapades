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

    trait :february_availability do
      after(:create) do |response|
        response.availabilities << create(:availability, :february)
      end
    end

    trait :march_availability do
      after(:create) do |response|
        response.availabilities << create(:availability, :march)
      end
    end

    trait :jan_march_availability do
      after(:create) do |response|
        response.availabilities << create(:availability, :january)
        response.availabilities << create(:availability, :march)
      end
    end

  end
end
