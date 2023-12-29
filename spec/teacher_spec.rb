require 'json'
require 'rspec'
require './teacher'

describe Teacher do
  # Create a sample student instance for testing
  let(:teacher) { Teacher.new(20, 'Math', name: 'Mario') }

  describe '#initialize' do
    it 'creates a new Teacher instance with the given age, specialization, and name' do
      expect(teacher.instance_variable_get(:@age)).to eq(20)
      expect(teacher.instance_variable_get(:@specialization)).to eq('Math')
      expect(teacher.instance_variable_get(:@name)).to eq('Mario')
      expect(teacher.instance_variable_get(:@rentals)).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'return always true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the student' do
      expected_json = {
        id: teacher.instance_variable_get(:@id),
        age: 20,
        specialization: 'Math',
        name: 'Mario'
      }.to_json

      expect(teacher.to_json).to eq(expected_json)
    end
  end
end
