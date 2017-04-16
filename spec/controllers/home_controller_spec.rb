require 'rails_helper'
require 'shared_contexts'


RSpec.describe HomeController do


  let(:user){ FactoryGirl.create(:user, email: 'test@testmail.co', password: '123456') }

  context "unauthenticated user" do

    describe "GET #index" do
      xit "is not successful" do
        get :index
        expect(response).not_to have_http_status(:success)
      end
      xit "redirects" do
        get :index
        expect(response.status).to eq(302)
      end
    end

  end

  context "authenticated user" do
    before do
      sign_in user
    end

    describe "GET #index" do
      xit "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

  end
end
