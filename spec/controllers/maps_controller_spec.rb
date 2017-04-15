require 'rails_helper'

RSpec.describe MapsController, type: :controller do

  let!(:user){ FactoryGirl.create(:user, email: 'test@mymail.com', password: 'hamandcheese') }
  let!(:map) { FactoryGirl.create(:map, user_id: user.id, name: 'Sample plot') }

  context "without authenticating " do
    describe "GET #index" do
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "GET #show" do
      it "redirects to the login page" do
        get :show, params: {id: 1}
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "PUT #update" do
      it "redirects to the login page" do
        put :update, params: {id: 1}
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "DELETE #destroy" do
      it "redirects to the login page" do
        delete :destroy, params: {id: 1}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "after authenticating " do
    before :each do
      sign_in user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: {id: 1}
        expect(response).to have_http_status(:success)
      end
    end


    describe "POST #create" do
      it "redirects to the map view" do
        post :create, params: { map: {name: 'new map', user_id: user.id} }
        map = Map.last
        expect(response).to redirect_to action: :show, id: map.id
      end
      it "adds a new map instance" do
        expect{ post :create, params: { map: {name: 'new map', user_id: user.id} } }.to change(Map, :count).by 1
      end
    end


    describe "PUT #update" do
      it "returns http success" do
        put :update, params: {id: map.id, map: { user_id: user.id, name: ' plot!' } }
        expect(response).to have_http_status(:success)
      end
      it "updates the map attributes" do
        put :update, params: { id: map.id, map: { user_id: user.id, name: 'Updated plot' } }
        map.reload
        expect(map.name).to eq('Updated plot')
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        delete :destroy, params: {id: map.id}
        expect(response).to have_http_status(:success)
      end
      it "removes the map record" do
        expect{ delete :destroy, params: { id: map.id } }.to change(Map, :count).by( -1 )
      end
    end
  end

end
