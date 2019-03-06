require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  let(:valid_attributes) { attributes_for(:photo) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
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

  describe "PUT #update" do
    context "with valid params" do
      let(:photo_tags) { { tags: %w(Me You) } }
      let(:update_attributes) { valid_attributes.merge(photo_tags) }

      before do
        @photo_1 = create(:photo)
      end

      it "updates the photo" do
        put :update, params: { id: @photo_1.to_param, photo: update_attributes }
        @photo_1.reload
        expect(@photo_1.tags).to eq(photo_tags[:tags])
      end

      it "redirects to the photo" do
        put :update, params: { id: @photo_1.to_param, photo: valid_attributes }
        expect(response).to redirect_to(@photo_1)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested photo" do
      photo = Photo.create! valid_attributes
      expect {
        delete :destroy, params: { id: photo.to_param }
      }.to change(Photo, :count).by(-1)
    end
  end

end
