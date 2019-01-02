require 'rails_helper'

RSpec.describe RacesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Race. As you add validations to Race, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RacesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Race.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      race = Race.create! valid_attributes
      get :show, params: {id: race.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      race = Race.create! valid_attributes
      get :edit, params: {id: race.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Race" do
        expect {
          post :create, params: {race: valid_attributes}, session: valid_session
        }.to change(Race, :count).by(1)
      end

      it "redirects to the created race" do
        post :create, params: {race: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Race.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {race: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested race" do
        race = Race.create! valid_attributes
        put :update, params: {id: race.to_param, race: new_attributes}, session: valid_session
        race.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the race" do
        race = Race.create! valid_attributes
        put :update, params: {id: race.to_param, race: valid_attributes}, session: valid_session
        expect(response).to redirect_to(race)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        race = Race.create! valid_attributes
        put :update, params: {id: race.to_param, race: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested race" do
      race = Race.create! valid_attributes
      expect {
        delete :destroy, params: {id: race.to_param}, session: valid_session
      }.to change(Race, :count).by(-1)
    end

    it "redirects to the races list" do
      race = Race.create! valid_attributes
      delete :destroy, params: {id: race.to_param}, session: valid_session
      expect(response).to redirect_to(races_url)
    end
  end

end
