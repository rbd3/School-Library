require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
class App
  attr_accessor :books, :peoples, :rentals

  def initialize
    @books = []
    @peoples = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index do |book, i|
        puts "Number: #{i + 1}, Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @peoples.empty?
      puts 'There are no people'
    else
      @peoples.each_with_index do |person, i|
        puts "Number: #{i + 1}, Name: #{person.name}, age: #{person.age}, ID: #{person.id}"
      end
    end
  end

  def create_student(age, has_parent_permission, name)
    student = Student.new(age, parent_permission: has_parent_permission, name: name)
    @peoples << student
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    @peoples << teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, selected_books, selected_persons)
    rental = Rental.new(date, selected_books, selected_persons)
    @rentals << rental
  end

  def list_rentals(person_id)
    person = @peoples.find { |p| p.id == person_id }
    if person.nil?
      puts "Person with ID #{person_id} not found."
    else
      puts "Name: #{person.name}"
      if person.rentals.empty?
        puts 'Has no rentals'
      else
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.books.title} by #{rental.books.author}"
        end
      end
    end
  end
end
