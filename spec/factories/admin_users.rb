# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "au#{n}-#{Time.now.to_i}@example.com" }
    password "password"
  end
end
