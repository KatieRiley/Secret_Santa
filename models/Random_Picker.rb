require_relative 'person'
require "csv"

class RandomPicker

  attr_accessor :random_array, :people_array
  def initialize
    @random_array = []
    @people_array = []
  end

  def add_person (name, phone_num, spouse, random_person)
    people_array.insert(people_array.size, Person.new(name, phone_num, spouse, random_person))
  end

  def match_up
    #go though persons array
    #for each index people_array[index].random_person = people_array[random_array[index]].name
    #check for names that match_up
    #check for spouses that match up
    import_from_csv("people_file.csv")
    people_size = people_array.size
    random_array = randomize_array(people_size - 1)
    index = 0
    people_array.each do |person|
      secret_index = (random_array[index]).to_i
      person.their_secret_person = people_array[secret_index].name
      index = index + 1
    end
  end

  def check_for_same_person
    index = 0
    people_array.each do |person|
      if (person.name == person.their_secret_person) || (person.spouse_name == person.their_secret_person)
        #if its the last element in the array swap with first element in the array
        #then recursivly call itself
        if index == people_array.size - 1
          container = person.their_secret_person
          person.their_secret_person = people_array[0].their_secret_person
          people_array[0].their_secret_person = container
          check_for_same_person
        #otherwise swap with the element to the right
        else
          container = person.their_secret_person
          person.their_secret_person = people_array[index + 1].their_secret_person
          people_array[index + 1].their_secret_person = container
        end
      end
      index = index + 1
    end
  end

  #puts the numbers from 0 to array_lenght - 1 (because we used .. not ...)
  #into an array, then shuffles the array to randomize it, this way we dont
  #end up with repets of the same number
  def randomize_array(array_length)
    (0..array_length).to_a.shuffle
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_person(row_hash["name"], row_hash["phone_number"], row_hash["spouse_name"], row_hash["their_secret_person"])
    end
  end
end
