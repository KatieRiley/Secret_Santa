class Person
  attr_accessor :name, :phone_number, :spouse_name, :their_secret_person

  def initialize(name, phone_number, spouse_name, their_secret_person)
    @name = name
    @phone_number = phone_number
    @spouse_name = spouse_name
    @their_secret_person = their_secret_person
  end
end
