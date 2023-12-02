require './book'
require './rental'

describe Book do
  let(:book) { Book.new('The Uthman', 'Diego S.') }
  let(:person) { instance_double('Person', name: 'John', age: 25, rentals: []) }
end
