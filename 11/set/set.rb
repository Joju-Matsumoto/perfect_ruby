require 'set'

p (1..5).to_set
s = Set.new(%w(Alice Bob Charlie)) do |name|
  name.upcase
end
p s

p Set[1, 2, 3, 3, 3, 4, 5]

a = (1..100).to_a
three = Set.new a.select {|v| v % 3 == 0}
five = Set.new a.select {|v| v % 5 == 0}
fifteen = three & five

p fifteen.subset? three
p three.superset? fifteen

