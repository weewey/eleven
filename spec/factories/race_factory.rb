FactoryBot.define do
  factory :race do
    name { 'Marathon 2019' }
    start_date { Time.now }
    distance { 10 }

    trait :with_official_race_photo do
      photos { create_list(:photo, 1, :race_official) }
    end

  end
end