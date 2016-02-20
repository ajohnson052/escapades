FactoryGirl.define do
  factory :availability do
    response
    start_date "2016-01-01"
    end_date "2016-02-28"
  end

  trait :february_only do
    after(:create) do |availability|
      availability.start_date = "2016-02-01"
      availability.end_date = "2016-02-28"
    end
  end

  trait :march_only do
    after(:create) do |availability|
      availability.start_date = "2016-03-01"
      availability.end_date = "2016-03-31"
    end
  end

end
