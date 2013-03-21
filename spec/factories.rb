FactoryGirl.define do
  
  factory :admin_user do
    sequence(:email) { |n| "au#{n}-#{Time.now.to_i}@example.com" }
    password "password"
  end
  
  factory :score do
    music "\relative c' { c d8 e f g a b c1 }"
  end
  
end
