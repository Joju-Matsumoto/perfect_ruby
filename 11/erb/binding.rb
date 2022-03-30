require 'erb'

erb = ERB.new("Hello, <%= name %>.\n")

b1 = lambda {
  name = :Alice

  binding
}

b2 = lambda {
  name = :Bob

  binding
}

class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

erb.run b1.call
erb.run b2.call

alice = Person.new :Charlie
erb.run(alice.instance_eval { binding })
