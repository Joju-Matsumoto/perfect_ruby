class A
end

module M
  refine A do
    names = %i[a b c d]
    names.each do |name|
      class_eval do
        define_method name do
          name
        end
      end
    end
  end
end

using M

a = A.new
p a.a
p a.b
p a.c
p a.d
p a.e
