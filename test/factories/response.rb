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
        response.availabilities << create(:availability, :february_only)
      end
    end

    trait :march_availability do
      after(:create) do |response|
        response.availabilities << create(:availability, :march_only)
      end
    end

    trait :with_jan_march_availability do
      after(:create) do |response|
        response.availabilities << create(:availability, :january_only)
        response.availabilities << create(:availability, :march_only)
      end
    end

  end
end
