require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
