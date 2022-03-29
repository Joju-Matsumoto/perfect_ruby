# frozen-string-literal: true

# class FirstClass
# end

p Class.ancestors
# => [Class, Module, Object, Kernel, BasicObject]

p Class.instance_methods(false)
# => [:allocate, :superclass, :new]

FirstClass = Class.new

first_class_instace = FirstClass.new
p first_class_instace.class.name

# 継承
second_class = Class.new(FirstClass)
p second_class.ancestors
# => [#<Class:0x0000000152085bf8>, FirstClass, Object, Kernel, BasicObject]

klass_object = nil

# プロックにdefでメソッドを定義できる
# ブロック引数はクラスオブジェクト( = self)
ThirdClass = Class.new do |klass|
  klass_object = klass
  p klass == klass_object

  def hello
    :hello
  end
end

third_class_instance = ThirdClass.new
p third_class_instance.hello

# 無名クラス
klass = Class.new
p klass.name # => nil

# インスタンスを作れる
obj = klass.new
p obj.class # #<Class:0x0000000*********>

# 定数に代入するとクラス名になる
NamedClass = klass
p obj.class # => NamedClass

# class定義式はスコープが変わる
external_scope = 1
class ExtDefineClass
  # puts external_scope # => NameError
end

# Class.newのメリットはスコープが変わらないこと
NewDefineClass = Class.new do
  p external_scope # => 1
end
