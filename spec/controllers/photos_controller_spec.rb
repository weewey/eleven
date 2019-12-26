require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  let(:valid_attributes) { attributes_for(:photo) }

  describe "GET #index" do
    let!(:photo_1) { create(:photo) }
    let!(:photo_2) { create(:photo, :race_official) }

    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end

    it 'only fetches non race official photos' do
      get :index, params: {}
      photos = assigns(:photos)
      expect(photos).to eq([photo_1])
    end
  end

  describe "GET #show" do
    before do
      @photo1 = create(:photo)
    end
    it "returns a success response" do
      get :show, params: { id: @photo1.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    before do
      photographer = create(:photographer)
      sign_in(photographer)
      allow(TextExtractionWorker).to receive(:perform_async)
    end

    context "with valid params" do
      it "creates a new Photo" do
        expect { post :create, params: { photo: valid_attributes } }.to change { Photo.count }.by(1)
      end

      it "redirects to the created photo" do
        post :create, params: { photo: valid_attributes }
        expect(response).to redirect_to(Photo.last)
      end

      it 'calls TextExtractionWorker' do
        expect(TextExtractionWorker).to receive(:perform_async)
        post :create, params: { photo: valid_attributes }
      end
    end
  end

  describe "GET #search" do
    before do
      @race = create(:race, name: 'Standard Charted Marathon')
      @photo = create(:photo, tags: ['James'], race_id: @race.id)
    end

    context "when the search includes tags that already exist" do
      before do
        allow(Photo).to receive(:of_race_with_tags).and_return([@photo])
      end

      it "calls race_with_tag" do
        expect(Photo).to receive(:of_race_with_tags).with(@race.id, 'James')
        get :search, params: { tag: 'James', race_id: @race.id }
      end

      it 'adds the notice on PHOTOS FOUND' do
        get :search, params: { tag: 'James', race_id: @race.id }
        expect(flash[:notice]).to eq("Photos Found")
      end
    end

    context "when the search includes tags that doesn't already exist" do
      before do
        allow(Photo).to receive(:of_race_with_tags).and_return([])
      end

      let(:non_existent_tags) { "abcdefg" }

      it 'adds the notice on NO PHOTOS FOUND' do
        get :search, params: { tag: non_existent_tags, race_id: @race.id }
        expect(flash[:notice]).to eq("No Photos Found. Returning the latest 10 photos")
        end

      it 'returns the latest 10 photos' do
        get :search, params: { tag: non_existent_tags, race_id: @race.id }
        expect(assigns[:photos]).to eq(Photo.last(10))
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      let(:photo_tags) { { tags_comma_separated: "Me,You" } }
      let(:update_attributes) { valid_attributes.merge(photo_tags) }

      before do
        sign_in(create(:photographer))
        @photo_1 = create(:photo)
      end

      it "updates the photo" do
        put :update, params: { id: @photo_1.to_param, photo: update_attributes }
        @photo_1.reload
        expect(@photo_1.tags).to include("Me", "You")
      end

      it "redirects to the photo" do
        put :update, params: { id: @photo_1.to_param, photo: update_attributes }
        expect(response).to redirect_to(@photo_1)
      end
    end
  end

  describe "DELETE #destroy" do

    before do
      sign_in(create(:photographer))
    end

    it "destroys the requested photo" do
      photo = Photo.create! valid_attributes
      expect {
        delete :destroy, params: { id: photo.to_param }
      }.to change(Photo, :count).by(-1)
    end
  end

end
