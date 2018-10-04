require File.expand_path('../../../config/environment', __FILE__)
require 'rspec-rails'
require_relative '../rails_helper'

describe UsersController, type: :controller do

  let(:attributes) do
    {
    name: "Test User",
    username: "testusername",
    email: "testuser@testemail.com",
    address: "404 Test Lane",
    phone_number: 5555555555,
    location_id: Location.first.id,
    taco_points: 0,
    password: "testuserpassword"
    }
  end

  describe "creation" do
    before { post :create, params:{user: attributes} }
    let(:user) {User.find_by(name: "Test User")}

    it "creates a new user" do
      expect(user).to_not be_nil
    end

  end

end
