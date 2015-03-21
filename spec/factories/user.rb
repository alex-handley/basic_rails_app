FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user-#{i}@mydomain.local" }
    password "password"
    password_confirmation "password"
  end
end

