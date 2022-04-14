array = [1, 2, [3, 4]]

m = Marshal.dump array

p m

a = Marshal.load m

p a

class MyClass
  attr_accessor :source, :temporary

  def marshal_dump
    @source
  end

  def marshal_load(s)
    @source = s
  end
end

origin = MyClass.new
origin.source = 'marshal data'
origin.temporary = 'temporary data'
p origin
data = Marshal.dump(origin)

copy = Marshal.load(data)
p copy
