require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    # rental.books = self
  end

  def to_json(option = {})
    {
      title: @title,
      author: @author
    }.to_json(option)
  end
end
