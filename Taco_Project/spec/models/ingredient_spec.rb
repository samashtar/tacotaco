require File.expand_path('../../../config/environment', __FILE__)

describe Ingredient do

  let(:attributes) do
    {
    name: "carrots",
    price: 0.75,
    calories: 500000,
    category: Category.first}
  end

  it "a valid ingredient is considered valid" do
    expect(Ingredient.new(attributes)).to be_valid
  end

  let(:missing_name) {attributes.except(:name)}
  let(:invalid_price) {attributes.merge(price: "invalid_price")}
  let(:invalid_calories) {attributes.merge(calories: "invalid_calories")}

  it "is invalid without a name" do
    expect(Ingredient.new(missing_name)).not_to be_valid
  end

  it "requires price to be an integer" do
    expect(Ingredient.new(invalid_price)).not_to be_valid
  end

  it "requires calories to be an integer" do
    expect(Ingredient.new(invalid_calories)).not_to be_valid
  end

end
