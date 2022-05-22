class A
  def initialize
    @name = 'jj'
  end

  def get_binding
    binding
  end
end

a = A.new
eval '@name = "jjj"', a.get_binding, __FILE__, __LINE__

p a
