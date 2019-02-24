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

end
