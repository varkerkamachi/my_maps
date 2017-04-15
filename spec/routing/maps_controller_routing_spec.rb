require 'rails_helper'

RSpec.describe MapsController, type: :routing do
	describe "routing" do
		it 'get /maps routes to maps#index' do
			expect( get '/maps' ).to route_to(controller: 'maps', action: 'index')
		end 
		it 'get /maps/:map_id routes to maps#show' do
			expect( get '/maps/:map_id' ).to route_to(controller: 'maps', action: 'show', id: ":map_id")
		end 
		it 'post /maps routes to maps#create' do
			expect( post '/maps' ).to route_to(controller: 'maps', action: 'create')
		end 
		it 'put /maps/:map_id routes to maps#update' do
			expect( put '/maps/:map_id' ).to route_to(controller: 'maps', action: 'update', id: ":map_id")
		end 
		it 'delete /maps/:map_id routes to maps#destroy' do
			expect( delete '/maps/:map_id' ).to route_to(controller: 'maps', action: 'destroy', id: ":map_id")
		end 
	end
end