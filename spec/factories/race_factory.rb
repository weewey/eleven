FactoryBot.define do
  factory :race do
    name { 'Marathon 2019' }
    start_date { Time.now }
    distance { 10 }
  end
end