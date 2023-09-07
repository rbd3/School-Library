require 'json'
require 'rspec'
require './base_decorator'
require './capitalize_decorator'

class NameableDouble
  def correct_name
    'originalname'
  end
end

describe CapitalizeDecorator do
  # Create a sample NameableDouble instance for testing
  let(:nameable_double) { NameableDouble.new }

  describe '#correct_name' do
    it 'capitalizes the name' do
      decorator = CapitalizeDecorator.new(nameable_double)
      expect(decorator.correct_name).to eq('Originalname')
    end
  end
end
