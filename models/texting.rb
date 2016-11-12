require_relative 'Random_Picker'


class Texting
  attr_accessor :my_random_picker
  def initialize
    @my_random_picker = RandomPicker.new
    my_random_picker.match_up

  end
end
