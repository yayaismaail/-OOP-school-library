require_relative 'storage'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'menu'
require_relative 'lister'

class App

  def initialize
    @save_book = SaveData.new('data/book.json')
    @save_person = SaveData.new('data/people.json')
    @save_rentals = SaveData.new('data/rentals.json')
    r = Rentals.new
    @books = load_books || []
    @people = load_people || []
    @rentals = load_rentals || []
  end

  def list_books
    Lister.new(@books).list_books
  end

  def list_people
    Lister.new(@people).list_people
  end

  def create_person
    person_type = person_type_input
    if person_type == 1
      person = create_student
    elsif person_type == 2
      person = create_teacher
    else
      puts 'Invalid input.'
      return
    end
    push_person_to_list(person)
    puts 'Person created successfully'
  end

  def person_type_input
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    gets.chomp.to_i
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has Parent Permission? [Y/N]:'
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(age, name, parent_permission)
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    Teacher.new(age, name, specialization)
  end

  def push_person_to_list(person)
    @people.push(person)
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i

    puts 'Date (YYYY-MM-DD):'
    date = Date.parse(gets.chomp)

    rental = Rental.new(date, @books[book], @people[person])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    Lister.new(rentals).list_rentals
  end

  def save_book
    @save_book.save_data(@books.map(&:to_hash))
  end

  def load_books
    books_data = @save_book.load_data
    return nil if books_data.nil?
    books_data.map { |book| Book.new(book['title'], book['author']) }
  end

  def save_person
    @save_person.save_data(@people.map(&:to_hash))
  end

  def save_rentals
    @save_rentals.save_data(@rentals.map(&:to_hash))
  end

  def exit_program 
    save_book
    save_person
    save_rentals
    puts "Thanks for using the application"
  end

  private :push_person_to_list, :create_teacher, :create_student, :person_type_input
end

class Rentals
  def add_rentals
    rentals = []
    if File.exist?('rentals.json') && !File.empty?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))
      data.each do |rental_data|
        book_data = rental_data['book']
        person_data = rental_data['person']
        book = Book.new(book_data['title'], book_data['author'])
        person = if person_data['type'] == 'Student'
                   Student.new(person_data['age'], person_data['classrom'], person_data['name'])
                 else
                   Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
                 end
        person.id = person_data['id']
        rentals << Rental.new(rental_data['date'], book, person)
      end
    end
    rentals
  end
end
