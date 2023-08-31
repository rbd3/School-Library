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
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_people
    if @peoples.empty?
      puts 'No people available'
    else
      @peoples.each { |person| puts person.name }
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

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def list_rentals(person_id)
    person = @peoples.find { |p| p.object_id == person_id }
    if person.nil?
      puts 'Person not found'
    else
      rentals = @rentals.select { |r| r.person.object_id == person_id }
      rentals.each { |rental| puts "#{rental.book.title} by #{rental.book.author}" }
    end
  end
end
