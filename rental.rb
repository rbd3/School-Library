class Rental
  attr_accessor :date, :books, :persons

  def initialize(date, books, persons)
    @date = date
    books = books
    @persons = persons

    books.add_rental(self)
    persons.add_rental(self)
  end
end
