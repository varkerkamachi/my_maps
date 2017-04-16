require 'spec_helper'

RSpec.describe HomeController, :type => :routing do
	describe "routing" do
    it 'get / routes to maps#index' do
      expect( get('/')).to route_to(controller: 'maps', action: 'index')
    end
  end
end