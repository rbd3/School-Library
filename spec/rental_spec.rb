require './rental'
require 'json'
require 'rspec'

describe Rental do
  let(:date) { '2023-09-07' }
  let(:book) { double('Book') }
  let(:person) { double('Person') }

  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'creates a new Rental instance with the given date, book, and person' do
      expect(rental.date).to eq(date)
      expect(rental.books).to eq(book)
      expect(rental.persons).to eq(person)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the rental' do
      expected_json = {
        date: date,
        books: book,
        persons: person
      }.to_json

      expect(rental.to_json).to eq(expected_json)
    end
  end
end
