require 'rails_helper'

RSpec.describe Photo, type: :model do

  describe 'validation' do
    subject { create(:photo) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid with no runners' do
      subject.runners = []
      expect(subject).to be_valid
    end

    it 'is valid with no photographers' do
      subject.photographer_id = nil
      expect(subject).to be_valid
    end

    it 'is invalid without race_official flag' do
      subject.race_official = nil
      expect(subject).to be_invalid
    end
  end

  describe 'scopes' do
    context '#of_race_and_tags' do
      let!(:race) { create(:race) }
      let!(:photo) { create(:photo, race_id: race.id, tags: ['spec']) }
      let!(:photo_1) { create(:photo, race_id: race.id, tags: ['abc']) }
      let!(:photo_2) { create(:photo, race_id: race.id, tags: ['spec', 'abc']) }

      it "should return the right photos" do
        result = Photo.of_race_with_tags(race.id, ['spec'])
        expect(result).to match_array([photo, photo_2])
      end
    end
  end
end
