require 'rails_helper'

RSpec.describe MarkersController, type: :controller do

  let!(:user){ FactoryGirl.create(:user, email: 'test@mymail.com', password: 'hamandcheese') }
  let!(:map) { FactoryGirl.create(:map, user_id: user.id, name: 'Sample plot') }
  let!(:map_marker) { FactoryGirl.create(:marker, map_id: map.id, name: 'Sngle Marker', resident_count: 8, marker_type: 'condo') }

  context "without authenticating " do
    describe "GET #index" do
      it "redirects to login" do
        get :index, params: { map_id: map.id }, format: :js
        expect(response.status).to eq 401 #unauthorized
      end
    end

    describe "GET #show" do
      it "redirects to login" do
        get :show, params: { map_id: map.id, id: 2 }, format: :js
        expect(response.status).to eq 401 #unauthorized
      end
    end

    describe "GET #create" do
      it "redirects to login" do
        get :create, params: { map_id: map.id, marker: { name: 'My marker' } }, format: :js
        expect(response.status).to eq 401 #unauthorized
      end
    end

    describe "GET #destroy" do
      it "redirects to login" do
        get :destroy, params: { map_id: map.id, id: 1 }, format: :js
        expect(response.status).to eq 401 #unauthorized
      end
    end
  end

  context "after authenticating " do
    before :each do
      sign_in user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index, params: { map_id: map.id }, format: :json
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET #show" do
      it "returns http success" do
        get :index, params: { map_id: map.id, id: 2 }, format: :json
        expect(response).to have_http_status(:success)
      end
    end
    describe "POST #create" do
      it "returns http success" do
        post :create, params: { map_id: map.id, marker: { name: 'First marker', resident_count: 2 } }, format: :json
        @marker = Marker.last
        expect(response).to redirect_to action: :show, id: @marker.id
      end
      it "adds a marker record" do
        expect{ 
          post :create, params: { map_id: map.id, marker: { name: 'First marker', resident_count: 2 } }, format: :json
        }.to change(Marker,:count).by 1
      end
    end
    describe "DELETE #destroy" do
      it "returns http success" do
        delete :destroy, params: {map_id: map.id, id: map_marker.id}, format: :json
        expect(response).to have_http_status(:success)
      end

      it "removes a marker record" do
        expect{ 
          delete :destroy, params: { map_id: map.id, id: map_marker.id}, format: :json
        }.to change(Marker, :count).by(-1)
      end
    end
  end
end
