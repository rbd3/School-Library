require 'json'
require 'rspec'
require './base_decorator'

# Create a test double for the Nameable class
class NameableDouble
  def correct_name
    'OriginalName'
  end
end

describe BaseDecorator do
  # Create a sample BaseDecorator instance for testing
  let(:nameable_double) { NameableDouble.new }
  let(:deco) { BaseDecorator.new(nameable_double) }

  describe '#initialize' do
    it 'creates a new BaseDecorator instance with the given nameable' do
      expect(deco.instance_variable_get(:@nameable)).to eq(nameable_double)
    end
  end

  describe '#correct_name' do
    it 'renames decorator' do
      allow(nameable_double).to receive(:correct_name).and_return('DecoratedName')

      expect(deco.correct_name).to eq('DecoratedName')
    end
  end
end
