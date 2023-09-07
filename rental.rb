require 'json'
class Rental
  attr_accessor :date, :books, :persons

  def initialize(date, books, persons)
    @date = date
    @books = books
    @persons = persons

    # books.add_rental(self)
    # persons.add_rental(self)
  end

  def to_json(option = {})
    {
      date: @date,
      books: @books,
      persons: @persons
    }.to_json(option)
  end
end
