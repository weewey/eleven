require 'rails_helper'

RSpec.describe Photographer, type: :model do
  describe 'validation' do
    let(:valid_attributes) { attributes_for(:photographer) }

    context 'with valid params' do
      it 'is valid' do
        photographer = Photographer.new(valid_attributes)
        expect(photographer).to be_valid
      end
    end

    context 'with invalid params' do
      it 'is invalid' do
        valid_attributes[:email] = nil
        expect(Photographer.new(valid_attributes)).to be_invalid
      end
    end

  end
end
