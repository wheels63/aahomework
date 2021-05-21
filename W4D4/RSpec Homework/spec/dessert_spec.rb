require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Yoshi") }
  let(:macaroon) { Dessert.new("macaroon", 20, chef) }

  describe "#initialize" do
    it "sets a type" do 
      expect(macaroon.type).to eq("macaroon")
    end

    it "sets a quantity" do
      expect(macaroon.quantity).to eq(20)
    end

    it "starts ingredients as an empty array"
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity"
      expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      macaroon.add_ingredient("sugar")
      expect(macaroon.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      ingredients = ["sugar", "egg", "butter", "salt", "cream", "vanilla extract"]

      ingredients.each do |ingredient|
        macaroon.add_ingredient(ingredient)
      end

      expect(macaroon.ingredients).to eq(ingredients)
      macaroon.mix!
      expect(macaroon.ingredients).not_to eq(ingredients)
      expect(macaroon.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      macaroon.eat(5)
      expect(macaroon.quantity).to eq(15)
    it "raises an error if the amount is greater than the quantity" do
      expect { macaroon.eat(25)}.to raise_error("not enough macaroons, buckaroo")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Yoshi the Great Baker")
      expect(macaroon.serve).to eq("Chef Yoshi the Great Baker has made 20 macaroons!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(macaroon)
      macaroon.make_more
    end
  end
end
