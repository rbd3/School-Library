require 'json'
require 'rspec'
require './book'

describe Book do
  # Create a sample book instance for testing
  let(:book) { Book.new('Title-1', 'Author-1') }

  describe '#initialize' do
    it 'creates a new book instance with the given title and author' do
      expect(book.title).to eq('Title-1')
      expect(book.author).to eq('Author-1')
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental' do
      rental = double('Rental')
      book.add_rental(rental)

      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the book' do
      expected_json = {
        title: 'Title-1',
        author: 'Author-1'
      }.to_json

      expect(book.to_json).to eq(expected_json)
    end
  end
end
