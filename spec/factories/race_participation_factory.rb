FactoryBot.define do
  factory :race_participation do
    bib_number { '12345' }
    race_id { create(:race).id }
    runner_id { create(:runner).id }
  end
end