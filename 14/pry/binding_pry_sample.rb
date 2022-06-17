require 'pry'

class Foo
  def initialize
    @bar = 'bar'
  end

  def bar
    binding.pry
    @bar
  end
end

puts Foo.new.bar
