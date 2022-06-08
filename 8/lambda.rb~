f = Proc.new { |x, y| x + y }
x = 1
p f.call(1, 2)
p f.(1, 2)
p f.(1, x)

add = Proc.new {|x, y| x+y }
inc = add.curry.(1)

p add.(1, 2)
p inc.(3)

inc2 = Proc.new { |y| add.(1, y) }

p inc2.(3)

