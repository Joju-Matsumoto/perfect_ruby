require 'erb'

name = 'Alice'
erb = ERB.new('Hello, <%= name %>')

# p erb.result(binding)
# erb.run binding
# puts
# p erb.src
# p eval(erb.src)

class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def run(erb)
    erb.run binding
  end

  def get_name
    name
  end
end

person = Person.new(:Bob)
# person.run erb
p person.methods.grep(/.*eval/)
p person.call(erb.src)
p person.get_name
