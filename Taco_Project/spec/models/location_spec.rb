require File.expand_path('../../../config/environment', __FILE__)

describe Location do

  let(:attributes) do
    {
    name: "Test Location",
    address: "Test Street 1, Washington D.C.",
    email: "test@email.com",
    phone_number: 55555555555
  }
  end

  it "a valid location is considered valid" do
    expect(Location.new(attributes)).to be_valid
  end

  let(:missing_name) {attributes.except(:name)}
  let(:invalid_phone) {attributes.merge(phone_number: "not_a_number")}
  let(:invalid_email) {attributes.merge(email: "not_an_email")}

  it "is invalid without a name" do
    expect(Location.new(missing_name)).not_to be_valid
  end

  it "is invalid with an invalid phone number" do
    expect(Location.new(invalid_phone)).not_to be_valid
  end

  it "is invalid with an invalid email address" do
    expect(Location.new(invalid_email)).not_to be_valid
  end

end
