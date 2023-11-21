class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age, parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_library?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
