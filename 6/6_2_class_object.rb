# frozen-string-literal: true

# クラス定義式ないでのselfはクラス自身
class Klass
  puts 'in class definition:'
  p self # => Klass
  @class_instance_val = :class_instance_val
  @@class_val = :class_val

  def self.class_method
    puts 'in class_method:'
    p self                  # => Klass
    p @@class_val           # => :class_val
    p @class_instance_val   # => :class_instance_val
  end

  def instance_method
    puts 'in instance_method:'
    p self                  # => #<Klass:0x000000016008a4b0> (インスタンス自身)
    p @@class_val           # => :class_val
    p @class_instance_val   # => nil  (クラスインスタンス変数は参照できない)
    p self.class.instance_variable_get :@class_instance_val # リフレクションを使えばアクセスできる
  end
end

class InheritedClass < Klass
  puts 'in Inherited Class'
  # クラスインスタンス変数は継承先から参照できない
  p @class_instance_val     # => nil
  p @@class_val             # => :class_val
  @@class_val = :inherited_class_val
end

Klass.class_method
klass = Klass.new
klass.instance_method
