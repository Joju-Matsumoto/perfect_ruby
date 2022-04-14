class A
  o = Object.new

  ObjectSpace.define_finalizer(o, proc { puts 'finalizing...' })
end

a = A.new
b = 1
c = [1, 2, 3]
d = :d

ObjectSpace.each_object(A) { |c| p c }

p ObjectSpace._id2ref(a.object_id)
