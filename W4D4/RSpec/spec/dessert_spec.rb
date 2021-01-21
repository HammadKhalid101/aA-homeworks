require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Gordon") }
  let(:icecream) { Dessert.new("icecream", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(icecream.type).to eq("icecream")
    end

    it "sets a quantity" do
      expect(icecream.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(icecream.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("brownie", "not an integer", chef) }.to raise_error(ArgumentError) 
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      icecream.add_ingredient("cheesecake")
      expect(icecream.ingredients).to include("cheesecake")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      ingredients = ["cheese", "ice", "cake", "vanilla"]
      
      ingredients.each { |ing| icecream.add_ingredient(ing) }

      expect(icecream.ingredients).to eq(ingredients)
      icecream.mix!
      expect(icecream.ingredients).not_to eq(ingredients)
      expect(icecream.ingredients.sort).to eq(ingredients.sort) 
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      icecream.eat(5)
      expect(icecream.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { icecream.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordon the Great Baker")
      expect(icecream.serve).to eq("Chef Gordon the Great Baker has made 10 icecreams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(icecream)
      icecream.make_more
    end
  end
end
