require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  attr_accessor :books, :peoples, :rentals

  def initialize
    @books = load_data('books.json')
    @peoples = load_data('peoples.json')
    @rentals = load_data('rentals.json')
  end

  def load_data(filename)
    if File.exist?(filename)
      JSON.parse(File.read(filename))
    else
      []
    end
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end

  def list_books
    if File.exist?('books.json')
      book_data = JSON.parse(File.read('books.json'))

      if book_data.empty?
        puts 'There are no books yet!'
      else
        book_data.each_with_index do |book, i|
          puts "Number: #{i + 1}, Title: #{book['title']}, Author: #{book['author']}"
        end
      end
    else
      puts 'The books file does not exist.'
    end
  end

  def list_people
    if File.exist?('peoples.json')
      people_data = JSON.parse(File.read('peoples.json'))

      if people_data.empty?
        puts 'There are no people in the file'
      else
        people_data.each_with_index do |person, i|
          puts "Number: #{i + 1}, Name: #{person['name']}, Age: #{person['age']}, ID: #{person['id']}"
        end
      end
    else
      puts 'The people file does not exist.'
    end
  end

  def create_student(age, has_parent_permission, name)
    student = Student.new(age, parent_permission: has_parent_permission, name: name)
    @peoples << student
    save_data('peoples.json', @peoples)
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    # Find and update or add teacher in @peoples
    index = @peoples.index { |p| p.id == teacher.id }
    if index.nil?
      @peoples << teacher
    else
      @peoples[index] = teacher
    end
    save_data('peoples.json', @peoples)
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
      File.write('peoples.json', JSON.generate(peoples))

    elsif type == 2
      puts 'Enter person age:'
      age = gets.chomp.to_i
      puts 'Enter person name:'
      name = gets.chomp
      puts 'Enter specialization'
      specialization = gets.chomp
      create_teacher(age, specialization, name)
      File.write('peoples.json', JSON.generate(peoples))
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
    File.write('books.json', JSON.generate(books))
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    save_data('books.json', @books)
  end
end
