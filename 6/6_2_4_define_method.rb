class Klass
  # defでインスタンスメソッド定義
  def instance_method1
    :instance_method1
  end

  # define_methodでインスタンスメソッド定義
  define_method :instance_method2, -> { :instance_method2 }

  class << self
    # define_methodでクラスオブジェクトにインスタンスメソッドを定義(= クラスメソッド)
    define_method :class_method1, -> { :class_method1 }
  end
end

obj = Klass.new
p obj.instance_method1
p obj.instance_method2
p Klass.class_method1

Klass.define_method :method3, -> { :method3 }

p obj.method3
