class A
  @name = :A
  @count = 0
  def self.hello
    puts "I'm #{self}, #{@name}, #{@count}"
    @count += 1
  end

  def hello
    puts "T'm #{self}"
  end
end

class B < A
  @name = :B
  @count = 0
end

class C < A
  @name = :C
  @count = 0
end

A.hello
B.hello
C.hello
A.new.hello
B.new.hello
C.new.hello
