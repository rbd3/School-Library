require_relative 'app'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class Main
  def create_person(app)
    puts 'Do you want to create a student (1) or teacher (2)? [Input number]:'
    type = gets.chomp.to_i
    if type == 1
      puts 'Enter person age:'
      age = gets.chomp.to_i
      puts 'Enter person name:'
      name = gets.chomp
      puts 'Has parent permission? [Yes/No]'
      has_parent_permission = gets.chomp.downcase
      app.create_student(age, has_parent_permission, name)
    elsif type == 2
      puts 'Enter person age:'
      age = gets.chomp.to_i
      puts 'Enter person name:'
      name = gets.chomp
      puts 'Enter specialization'
      specialization = gets.chomp
      app.create_teacher(age, specialization, name)
    else
      puts 'Invalid input'
    end
  end

  def create_book(app)
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    app.create_book(title, author)
  end

  def create_rental(app)
    puts 'Enter rental date:'
    date = gets.chomp
    app.list_books
    puts 'Enter book number:'
    book = gets.chomp.to_i
    app.list_people
    puts 'Enter person number:'
    person = gets.chomp.to_i
    app.create_rental(date, app.books[book - 1], app.people[person - 1])
  end

  def list_rentals(app)
    app.list_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    app.list_rentals(id)
  end

  def list_options
    puts 'Enter number to pick an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. End'
  end
end

def main
  app = App.new
  main_instance = Main.new
  loop do
    main_instance.list_options
    option = gets.chomp.to_i
    options = {
      1 => -> { app.list_books },
      2 => -> { app.list_people },
      3 => -> { main_instance.create_person(app) },
      4 => -> { main_instance.create_book(app) },
      5 => -> { main_instance.create_rental(app) },
      6 => -> { main_instance.list_rentals(app) },
      7 => -> { exit }
    }
    if options.key?(option)
      options[option].call
    else
      puts 'Invalid option'
    end
  end
end

main
