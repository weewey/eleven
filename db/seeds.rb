require 'faker'

Faker::Config.locale = 'en'
I18n.reload!

def seed_race_with_official_photo
  puts __method__.to_s
  race_official_photos_path = Rails.root.join('spec', 'fixtures', 'race_official_photos')
  Dir.glob("#{race_official_photos_path }/*.png").each do |race_picture|
    race_name = race_picture.split('/')[-1][0..-5]
    today_8_am = DateTime.now.change({hour: 8, min: 0, sec: 0})
    race_distance = 42.195
    race = Race.create(name: race_name, start_date: today_8_am, distance: race_distance)
    Photo.create(tags: [PhotoTags::OFFICE_RACE_PHOTO], image: Pathname.new(race_picture).open,
                 race_id: race.id, race_official: true)
  end
end

def seed_photographer
  puts __method__.to_s
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  Photographer.create(first_name: first_name, last_name: last_name, email: email)
end

def seed_admin
  admin = Photographer.new(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  admin.skip_confirmation!
  admin.save!
end

def seed_race_photos(race, photographer, runner)
  puts __method__.to_s
  Photo.create(tags: [Faker::Artist.name], remote_image_url: (Faker::Avatar.image),
               race_id: race.id, photographer_id: photographer.id, runners: [runner],
               race_official: false)
end

def seed_runner
  puts __method__.to_s
  Runner.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Name.email
  )
end

def seed_race_participation(race, runner)
  puts __method__.to_s
  bib_number = "#{Faker::Lorem.characters(number: 1).upcase}#{Faker::Number.number(digits: 5)}"
  RaceParticipation.create(bib_number: bib_number, race_id: race.id, runner_id: runner.id)
end

def seed_assignment_with_race(race, photographer)
  puts __method__.to_s
  Assignment.create(race_id: race.id,
                    photographer_id: photographer.id)
end

#unless Race.all.count > 0
#  puts "seeding db"
#
#  seed_race_with_official_photo
#  Race.all.each do |race|
#    photographer = seed_photographer
#    runner = seed_runner
#    seed_race_participation(race, runner)
#    seed_race_photos(race, photographer, runner)
#    seed_assignment_with_race(race, photographer)
#  end
#
#end

seed_photographer