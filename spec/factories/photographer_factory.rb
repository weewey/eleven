require 'faker'

FactoryBot.define do
  factory :photographer do
    first_name { 'first' }
    last_name { 'last' }
    email { Faker::Internet.email }
    password { 'abc123efg' }
    confirmed_at { Time.now - 1.day }
  end
end