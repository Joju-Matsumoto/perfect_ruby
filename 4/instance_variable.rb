class A
  @name = 'joju'
  @@name = :whoami
  def self.hello
    puts "hello #{@name}"
  end

  def initialize
    @name = 'matsumoto'
  end

  def hello
    puts "hello #{@name}"
  end
end

class B < A
end

a = A.new
a.hello

A.hello
p A.class_variables
p A.instance_variables
p A.singleton_class.class_variables
p A.singleton_class.instance_eval('@name', __FILE__, __LINE__)

b = B.new
b.hello

B.hello
