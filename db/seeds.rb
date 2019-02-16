require 'faker'

Faker::Config.locale = 'en'
I18n.reload!

def seed_race
  today_8_am = DateTime.now.change({ hour: 8, min: 0, sec: 0 })
  race_name = Faker::StrangerThings.quote
  race_distance = Faker::Number.decimal(2)
  Race.create(name: race_name, start_date: today_8_am, distance: race_distance)
end

def seed_photographer
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  Photographer.create(first_name: first_name, last_name: last_name, email: email)
end

def seed_photos_with_race_and_photographer(race, photographer, runner)
  photo = Photo.create(
    tags: [Faker::Dog.name, Faker::DragonBall.character],
    remote_image_url: (Faker::Avatar.image),
    race_id: race.id,
    photographer_id: photographer.id
  )
  photo.runners << runner
  photo.save!
  photo
end

def seed_runner
  Runner.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.email
  )
end

def seed_race_participation(race, runner)
  bib_number = "#{Faker::Lorem.characters(1).upcase}#{Faker::Number.number(5)}"
  RaceParticipation.create(bib_number: bib_number, race_id: race.id, runner_id: runner.id)
end

def seed_assignment_with_race(race, photographer)
  Assignment.create(race_id: race.id,
                    photographer_id: photographer.id)
end

10.times do |time|
  puts "seeding db #{time}"
  race = seed_race
  photographer = seed_photographer
  runner = seed_runner
  seed_race_participation(race, runner)
  seed_photos_with_race_and_photographer(race, photographer, runner)
  seed_assignment_with_race(race, photographer)
end