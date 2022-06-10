require 'erb'

erb = ERB.new("Hello, <%= name %>.\n")

name = :jj

b1 = lambda { |; name|
  name = :Alice

  binding
}

b2 = lambda { |; name|
  name = :Bob

  binding
}

b3 = lambda {
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
# erb.run b3.call

alice = Person.new :Charlie
erb.run(alice.instance_eval { binding })
puts erb.src
