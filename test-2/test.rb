require_relative 'printable'

class Numeric
  include Printable
end

class Person
  include Printable

  def initialize(name)
    @name = name
  end

  attr_accessor :name
end

person = Person.new("Dima")
person.print_info # --> Obj info: #<Person:0x0000015fc6260990 @name="Dima">

# missing_method situation
person.print # --> There is no method print in class Person

var = 4
var.print_info # --> Obj info: 4