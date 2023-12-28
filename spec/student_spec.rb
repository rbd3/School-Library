require 'json'
require 'rspec'

require './student'

describe Student do
  # Create a sample student instance for testing
  let(:student) { Student.new(20, parent_permission: false, name: 'Mario') }

  describe '#initialize' do
    it 'creates a new student instance with the given age, parent_permission, and name' do
      expect(student.instance_variable_get(:@age)).to eq(20)
      expect(student.instance_variable_get(:@parent_permission)).to eq(false)
      expect(student.instance_variable_get(:@name)).to eq('Mario')
      expect(student.instance_variable_get(:@rentals)).to be_empty
    end
  end

  describe '#classroom' do
    it 'returns the classroom of the student' do
      classroom = double('Classroom', classroom: 'L1')
      allow(student).to receive(:classroom).and_return(classroom)
      expect(student.classroom.classroom).to eq('L1')
    end
  end

  describe '#play_hooky' do
    it 'returns a "¯(ツ)/¯" string' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the student' do
      expected_json = {
        id: student.instance_variable_get(:@id),
        age: 20,
        parent_permission: false,
        name: 'Mario'
      }.to_json

      expect(student.to_json).to eq(expected_json)
    end
  end
end
