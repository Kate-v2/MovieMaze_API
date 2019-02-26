FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Username#{n}" }
    password            { "password" }
    sequence(:token)    { |n| "123#{n}" }
    sequence(:email)    { |n| "email#{n}" }
  end
end
