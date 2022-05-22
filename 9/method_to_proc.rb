module M
  refine Kernel do
    def check(object, name); end
  end
end

class Human
  def initialize(name)
    @name = name
  end

  def hello
    puts "hello, #{@name}!"
  end
end

h = Human.new('jj')
h.hello

m = h.method(:hello)

m.call

p m.owner
p m.name
p m.receiver

um = Human.instance_method(:hello)

um.bind(h).call

h2 = Human.new('Alice')

um.bind(h2).call
