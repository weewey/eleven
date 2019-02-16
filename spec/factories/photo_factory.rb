FactoryBot.define do
  factory :photo do
    image do
      Rack::Test::UploadedFile.new(File.open(Rails.root.join('spec', 'fixtures', 'ken_mun_photo.jpg')))
    end
    tags { ["Wong Ken Mun", "A30130", "SCSM2018"] }
    race_id { create(:race).id }
    photographer_id { create(:photographer).id }
  end
end