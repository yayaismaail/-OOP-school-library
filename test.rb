require_relative 'person'

person = Person.new('Alice', 25)
puts "can the the person use the library #{person.can_use_library?}"
puts "How old is the person#{person.age}"
