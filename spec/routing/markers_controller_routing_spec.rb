require 'rails_helper'

RSpec.describe MarkersController, :type => :routing do
	describe "routing" do
		it "GET maps/2/markers routes to markers#index" do
			expect( get 'maps/2/markers').to route_to('markers#index', map_id: '2')
		end
		it "GET maps/2/markers/3 routes to markers#show" do
			expect( get 'maps/2/markers/3').to route_to('markers#show', map_id: '2', id: '3')
		end
		it "POST maps/2/markers routes to markers#create" do
			expect( post 'maps/2/markers').to route_to('markers#create', map_id: '2')
		end
		it "DELETE maps/2/markers/4 routes to markers#destroy" do
			expect( delete 'maps/2/markers/4').to route_to('markers#destroy', map_id: '2', id: '4')
		end

	end
end