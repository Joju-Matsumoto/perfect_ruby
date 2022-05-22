module M
  def method1
    :method1_M
  end
end

module N
  def method1
    :method1_N
  end
end

class A
  def self.method1
    :method1_A
  end
end

class B
  def self.method1
    :method1_B
  end
end

a = A.new

# A.include M
# A.singleton_class.include M
A.singleton_class.include M
# A.prepend M
# A.singleton_class.prepend M
B.singleton_class.prepend M
B.singleton_class.prepend N

p A.ancestors
p A.singleton_class.ancestors
p B.ancestors
p B.singleton_class
p B.singleton_class.ancestors
p A.method1
p B.method1
