class A
  def initialize(v)
    @v = v
  end

  def method_missing(name, *args, **kwargs, &block)
    @v.__send__ name, *args, **kwargs, &block
  end
end

a = A.new((1..5))
p a.map { |i| i * 3 }
