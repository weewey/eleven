require 'rails_helper'

RSpec.describe RaceHelper, type: :helper do

  describe '#official_race_photo_img' do
    subject { html = helper.official_race_photo_img(race);
    doc = Nokogiri::HTML(html); doc.root; }

    context 'when the race has an official race photo' do
      let(:race) { create(:race, :with_official_race_photo) }

      it 'should return the official photo img tag' do
        assert_select subject, 'img' do |tag|
          expect(tag.attr('src').value).to eq(race.photos.first.image.url)
        end
      end
    end

    context 'when the race has no official race photo' do
      let(:race) { create(:race) }

      it 'should an img with no src' do
        assert_select subject, 'img' do |tag|
          expect(tag.attr('src').value).to eq('')
          expect(tag.attr('alt').value).to eq('Race Official Photo')
        end
      end
    end
  end


end