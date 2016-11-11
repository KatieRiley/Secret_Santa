require_relative '../models/Random_Picker'

RSpec.describe RandomPicker do
  let (:random_array) {RandomPicker.new}
  describe "attributes" do
    it "initializes an array" do
      expect(random_array.random_array).to be_an(Array)
    end
    it "initializes an empty array" do
      expect(random_array.random_array.size).to be eq 0
    end
  end

  describe "#randomize_array" do
    it "adds random numbers into the arrray" do
      random_array.randomize_array(5)
      expect(random_array.random_array.size).to eq 5
    end
  end
end
