require_relative '../models/person'

RSpec.describe Person do
  let(:person) {Person.new('Katie', '111.111.1111', 'Casey', 'Don')}
  describe "attributes" do
    it "responds to name" do
      expect(person).to respond_to(:name)
    end
    it "reports its name" do
      expect(person.name).to eq('Katie')
    end
    it "responds to phone number" do
      expect(person).to respond_to(:phone_number)
    end
    it "reports its phone number" do
      expect(person.phone_number).to eq('111.111.1111')
    end
    it "responds to spouse name" do
      expect(person).to respond_to(:spouse_name)
    end
    it "reports its spouses name" do
      expect(person.spouse_name).to eq('Casey')
    end
    it "responds to their secret person" do
      expect(person).to respond_to(:their_secret_person)
    end
    it "reports its secret person" do
      expect(person.their_secret_person).to eq('Don')
    end
  end

end
