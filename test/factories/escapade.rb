FactoryGirl.define do
  factory :escapade do
    user
    title "Title"
    start_date "2016-01-01"
    end_date "2017-01-01"

    trait :with_response do
      after(:create) do |escapade|
        escapade.responses << create(:response, :with_availability)
      end
    end

    trait :overlapping_responses do
      after(:create) do |escapade|
        escapade.responses << create(:response, :with_availability)
        escapade.responses << create(:response, :february_availability)
      end
    end

  end
end
