require 'rails_helper'

RSpec.describe Race, type: :model do

  describe 'creating with params' do
    let(:valid_attributes) { attributes_for(:race) }

    it 'is valid' do
      race = Race.new(valid_attributes)
      expect(race).to be_valid
    end
  end
end
