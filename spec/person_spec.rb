# spec/person_spec.rb
require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trim'
require_relative 'person'

RSpec.describe Person do
  # person_spec.rb
describe '#initialize' do
it 'creates a Person instance with the provided attributes' do
  person = Person.new(25, 'John Doe', parent_permission: true)

  expect(person.age).to eq(25)
  expect(person.name).to eq('John Doe')
  expect(person.rentals).to be_empty
  expect(person.parent_permission).to be_truthy  # Ensure parent_permission is set
end
end


  describe '#can_use_services?' do
    it 'returns true for a person of age' do
      person = Person.new(20)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns true for a person with parent permission' do
      person = Person.new(15, 'Jane Doe', parent_permission: true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns false for a person without parent permission and not of age' do
      person = Person.new(15, 'Bob')
      expect(person.can_use_services?).to be_falsy
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental instance and adds it to the rentals array' do
      person = Person.new(30, 'Alice')
      book = Book.new('The Great Gatsby')
      rental_date = Date.today

      person.add_rental(rental_date, book)

      expect(person.rentals.size).to eq(1)
      expect(person.rentals.first).to be_an_instance_of(Rental)
    end
  end

describe '#to_hash' do
it 'returns a hash representation of the Person instance' do
  person = Person.new(25, 'John Doe', parent_permission: true)

  expected_hash = {
    id: person.id,
    name: 'John Doe',
    age: 25,
    parent_permission: true  # Ensure parent_permission is set
  }

  expect(person.to_hash).to eq(expected_hash)
end
end

end
