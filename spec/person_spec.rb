require 'json'
require 'rspec'

# Load the Person class from your code
require './person'

describe Person do
  # Create a sample person instance for testing
  let(:person) { Person.new(20, parent_permission: true, name: 'Jule') }

  describe '#initialize' do
    it 'creates a new person instance with the given age, parent_permission, and name' do
      expect(person.instance_variable_get(:@age)).to eq(20)
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
      expect(person.instance_variable_get(:@name)).to eq('Jule')
      expect(person.instance_variable_get(:@rentals)).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental' do
      rental = double('Rental')
      person.add_rental(rental)

      expect(person.rentals).to include(rental)
    end
  end

  describe '#of_age?' do
    it 'returns true if age >= 18' do
      result = person.send(:of_age?) # Access the private method using send
      expect(result).to eq(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if age >= 18' do
      expect(person.can_use_services?).to eq(true)
    end
  end
end
