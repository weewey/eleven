require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'validation' do
    let(:valid_attributes) { attributes_for(:photo) }

    it 'is valid' do
      photo = Photo.create(valid_attributes)
      expect(photo).to be_valid
    end

    it 'is valid with no runners' do
      photo = Photo.create(valid_attributes.except(:runners))
      expect(photo).to be_valid
    end

    it 'is valid with no photographers' do
      photo = Photo.create(valid_attributes.except(:photographer_id))
      expect(photo).to be_valid
    end
  end

end
