require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.first_name }
    email { Faker::Internet.email }
  end

  factory :event do
    name { Faker::Hipster.sentence(3)}
    location { Faker::Address.street_address }
    event_date { Faker::Time.between(10.days.ago, 10.days.from_now) }
  end
end
