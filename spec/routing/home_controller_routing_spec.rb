require 'spec_helper'

RSpec.describe HomeController, :type => :routing do
	describe "routing" do
    it 'get / routes to home#index' do
      expect( get('/')).to route_to(controller: 'home', action: 'index')
    end
  end
end