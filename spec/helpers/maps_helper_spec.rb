require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MapsHelper. For example:
#
# describe MapsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MapsHelper, type: :helper do
  describe "#display_lat_long" do
  	let(:user) { FactoryGirl.create(:user, email: 'me@mymail.com', password: '123456') }
  	let(:map) { FactoryGirl.create(:map, name: 'Topo sampler', user: user, lat1: 45, lat2: 90, long1: 100, long2: 150) }
  	it "returns a string when no argument is passed" do
  		expect(display_lat_long.class).to eq String
  	end
  	it "returns a string when an argument is passed" do
  		expect(display_lat_long(map).class).to eq String
  	end
  	it "returns both sets of coordinates in parentheses, space-separated" do
  		expect(display_lat_long(map)).to eq "(45.0, 100.0) (90.0, 150.0)"
  	end
  end
end
