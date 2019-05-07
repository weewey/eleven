require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'get #index' do
    let(:race_1) { create(:race, start_date: Time.now) }
    let(:race_2) { create(:race, start_date: (Time.now + 1.day)) }
    let(:num_featured_races) { 2 }

    before do
      stub_const('HomeController::NUM_FEATURED_RACES', num_featured_races)
    end

    it 'assigns the featured races' do
      get :index
      featured_races = assigns(:featured_races)
      expect(featured_races).to eq([race_2, race_1])
    end

    it 'only features races with offical photo' do
      get :index
      featured_races = assigns(:featured_races)
    end
  end
end
