require 'rails_helper'

RSpec.describe Map, type: :model do
  
	let!(:user) { FactoryGirl.create(:user, email: 'user1@mymail.com', password: '123456') }
	let!(:user2) { FactoryGirl.create(:user, email: 'user2@mymail.com', password: '123456') }
	let!(:map1) { FactoryGirl.create(:map, name: 'map 1', user_id: user.id) }
	let!(:map2) { FactoryGirl.create(:map, name: 'second map', user_id: user2.id) }
  context 'scopes' do
  	describe '#of_user' do
  		it 'returns maps belonging to the passed in user_id' do
  			expect(Map.of_user(user)).to eq [map1]
  		end
  	end
  end

  context 'validation' do
    describe 'required values ...' do
      it 'include user_id' do
        expect(Map.create(name: 'Big Mountain!', lat1: 20.04, description: 'Single point ')).not_to be_valid
      end
      it 'raises an exception without the user_id' do
        expect{ Map.create!(name: 'Big Mountain!', lat1: 20.04, description: 'Single point ') }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
