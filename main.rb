require_relative 'app'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class Main

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
      3 => -> { app.create_person },
      4 => -> { app.create_book_with_input },
      5 => -> { app.create_rental },
      6 => -> { app.list_rentals },
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
