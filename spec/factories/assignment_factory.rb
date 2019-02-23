FactoryBot.define do
  factory :assignment do
    race_id { create(:race).id }
    photographer_id { create(:photographer).id }
  end
end