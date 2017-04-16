require 'rails_helper'

RSpec.describe Marker, type: :model do
	let!(:user) { FactoryGirl.create(:user, email: 'user1@mymail.com', password: '123456') }
	let!(:user2) { FactoryGirl.create(:user, email: 'user2@mymail.com', password: '123456') }
	let!(:map1) { FactoryGirl.create(:map, name: 'map 1', user_id: user.id) }
	let!(:map2) { FactoryGirl.create(:map, name: 'second map', user_id: user2.id) }
	let!(:markerA) { FactoryGirl.create(:marker, name: 'A marker', map_id: map1.id) }
	let!(:markerB) { FactoryGirl.create(:marker, name: 'B marker', map_id: map1.id) }
	let!(:markerC) { FactoryGirl.create(:marker, name: 'C marker', map_id: map2.id) }
  context 'scopes' do
  	describe '#of_map' do
  		it 'returns markers belonging to the passed in map_id' do
  			expect(Marker.of_map(map1)).to eq [markerA, markerB]
  		end
  	end
  end
end
