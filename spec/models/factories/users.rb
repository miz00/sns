FactoryGirl.define do
  factory :user do
    name "one"
    sequence(:email){|i| "one#{i}@test.jp"} 
    password "123456"
  end
end