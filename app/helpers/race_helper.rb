module RaceHelper
  def official_race_photo_img(race)
    official_race_photo = race.photos.where(race_official: true).first
    return image_tag('', alt: 'Race Official Photo') if official_race_photo.nil?

    image_tag(official_race_photo.image.url, alt: 'Race Official Photo', height: '300', width: '300')
  end
end