require 'json'
require 'rspec'

require './classroom'

describe Classroom do
  # Create a sample book instance for testing
  let(:classroom) { Classroom.new('Label-1') }

  describe '#initialize' do
    it 'creates a new Classroom instance with the given label' do
      expect(classroom.label).to eq('Label-1')
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student' do
      student = double('student')
      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end
  end
end
