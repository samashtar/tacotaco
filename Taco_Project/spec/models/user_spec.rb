require File.expand_path('../../../config/environment', __FILE__)

describe User do

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

  it "a valid user is considered valid" do
    expect(User.new(attributes)).to be_valid
  end

  let(:missing_name) {attributes.except(:name)}
  let(:missing_username) {attributes.except(:username)}
  let(:invalid_phone) {attributes.merge(phone_number: "not_a_number")}
  let(:invalid_email) {attributes.merge(email: "not_an_email")}

  it "is invalid without a name" do
    expect(User.new(missing_name)).not_to be_valid
  end

  it "is invalid without a username" do
    expect(User.new(missing_username)).not_to be_valid
  end

  it "is invalid with an invalid phone number" do
    expect(User.new(invalid_phone)).not_to be_valid
  end

  it "is invalid with an invalid email address" do
    expect(User.new(invalid_email)).not_to be_valid
  end

end
