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

  factory :release do
    title Faker::Lorem.sentence(2)
    track_list Faker::Lorem.sentence(2)
    year_released "2015"
    record_label Faker::Lorem.sentence(1)
    record_label_url Faker::Internet.url
    wiki_link Faker::Internet.url
    release_type "CD"
    release_length "LP"
  end
end
