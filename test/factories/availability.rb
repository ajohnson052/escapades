FactoryGirl.define do
  factory :availability do
    response
    start_date "2016-01-01"
    end_date "2016-02-28"
  end

  trait :january do
    after(:create) do |availability|
      availability.start_date = "2016-01-01"
      availability.end_date = "2016-01-31"
    end
  end

  trait :february do
    after(:create) do |availability|
      availability.start_date = "2016-02-01"
      availability.end_date = "2016-02-28"
    end
  end

  trait :march do
    after(:create) do |availability|
      availability.start_date = "2016-03-01"
      availability.end_date = "2016-03-31"
    end
  end

end
