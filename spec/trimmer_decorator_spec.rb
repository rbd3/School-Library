require 'json'
require 'rspec'
require './base_decorator'
require './trimmer_decorator'

class NameableDouble
  def correct_name
    'originalname'
  end
end

describe TrimmerDecorator do
  let(:nameable_double) { NameableDouble.new }

  describe '#correct_name' do
    it 'Trimm the name' do
      decorator = TrimmerDecorator.new(nameable_double)
      expect(decorator.correct_name).to eq('originalna')
    end
  end
end
