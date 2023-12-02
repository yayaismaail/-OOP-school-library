# require 'rspec'
# require_relative 'book'  # Assuming your Book class is in a file named 'book.rb'
require 'date'
require 'rspec'
require_relative 'book'

RSpec.describe Book do
  let(:book_title) { 'Test Book' }
  let(:author_name) { 'Test Author' }

  describe '#initialize' do
    it 'creates a new book with a random ID, title, author, and an empty rentals array' do
      book = Book.new(book_title, author_name)
      expect(book.id).to be_an(Integer)
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(author_name)
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
  it 'adds a new rental to the book' do
    book = Book.new(book_title, author_name)
    date = Date.today
    person = instance_double('Person', rentals: [])  # Configure rentals method

    expect {
      book.add_rental(date, person)
    }.to change { book.rentals.length }.by(1)

    rental = book.rentals.first
    expect(rental.date).to eq(date)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end
end

  describe '#to_hash' do
    it 'returns a hash representation of the book' do
      book = Book.new(book_title, author_name)
      expected_hash = { id: book.id, title: book_title, author: author_name }

      expect(book.to_hash).to eq(expected_hash)
    end
  end
end
