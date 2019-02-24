require 'rails_helper'

RSpec.describe Race, type: :model do

  describe 'creating with params' do
    let(:valid_attributes) { attributes_for(:race) }

    it 'is valid' do
      race = Race.new(valid_attributes)
      expect(race).to be_valid
    end
  end

  describe '#destroy' do
    context 'when with photos, assignments , race_participations' do
      let(:race) { create(:race) }
      let(:assignment) { create(:assignment) }
      let(:photo) { create(:photo, race: race) }
      let(:photographer) { create(:photographer, assignments: [assignment]) }
      let(:runner) { create(:runner,) }
      let(:race_participation) { create(:race_participation, race: race, runner: runner) }

      before do
        race.assignments = [assignment]
        race.photographers = [photographer]
        race.photos = [photo]
        race.race_participations = [race_participation]
        race.runners = [runner]
        race.save!
      end

      it 'should delete all the dependent records' do
        race.destroy!
        expect(race.destroyed?).to be true
        expect(assignment.destroyed?).to be true
        expect(photo.destroyed?).to be true
        expect(race_participation.destroyed?).to be true
      end

      it 'should not delete the associated runner and photographer' do
        race.destroy!
        expect(race.destroyed?).to be true
        expect(runner.destroyed?).to be false
        expect(photographer.destroyed?).to be false
      end
    end
  end

end
