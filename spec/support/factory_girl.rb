require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :band do
    name Faker::Lorem.sentence(2)
    biography Faker::Lorem.paragraph(4)
    official_link Faker::Internet.url
    wiki_link Faker::Internet.url
  end
end
