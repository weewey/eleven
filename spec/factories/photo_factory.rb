FactoryBot.define do
  factory :photo do
    image do
      Rack::Test::UploadedFile.new(File.open(Rails.root.join('spec', 'fixtures', 'ken_mun_photo.jpg')))
    end
    tags { ["Wong Ken Mun", "A30130", "SCSM2018"] }
    race_official { false }
    race_id { create(:race).id }

    trait :race_official do
      race_official { true }
    end

  end
end