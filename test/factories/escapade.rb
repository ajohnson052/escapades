FactoryGirl.define do
  factory :escapade do
    user
    title "Title"
    start_date "2016-01-01"
    end_date "2017-01-01"

    trait :with_response do
      after(:build) do |response|
        create(:response, :with_availability)
      end
    end

  end
end
