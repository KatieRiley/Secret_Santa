class RandomPicker

  attr_accessor :random_array
  def initialize
    @random_array = []
  end

  def randomize_array(array_length)
    random_array = (0..array_length).to_a.shuffle
  end
end
