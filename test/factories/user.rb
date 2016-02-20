FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@domain.com"}
    password "password"
  end
end
