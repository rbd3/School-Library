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

  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input number]:'
    type = gets.chomp.to_i
    if type == 1
      puts 'Enter person age:'
      age = gets.chomp.to_i
      puts 'Enter person name:'
      name = gets.chomp
      puts 'Has parent permission? [Yes/No]'
      has_parent_permission = gets.chomp
      create_student(age, has_parent_permission, name)

    elsif type == 2
      puts 'Enter person age:'
      age = gets.chomp.to_i
      puts 'Enter person name:'
      name = gets.chomp
      puts 'Enter specialization'
      specialization = gets.chomp
      create_teacher(age, specialization, name)
    else
      puts 'Invalid input'
    end
  end

  def create_book_with_input
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    create_book(title, author)
  end  

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, selected_books, selected_persons)
    rental = Rental.new(date, selected_books, selected_persons)
    @rentals << rental
  end

  def create_rental_input
    puts 'Enter rental date:'
    date = gets.chomp
    list_books
    puts 'Enter book number:'
    book = gets.chomp.to_i
    list_people
    puts 'Enter person number:'
    person = gets.chomp.to_i
    create_rental(date, books[book - 1], peoples[person - 1])
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
  def list_rentals_input
    list_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    list_rentals(id)
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
