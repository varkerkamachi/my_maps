require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'integrity' do
  	xit 'has a valid factory' do
  		expect{ FactoryGirl.create(:user) }.not_to raise_error
  	end
  end
end
