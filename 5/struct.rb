Human = Struct.new(:name, :age, :gender)

human = Human.new('joju', 24, :male)
p human

Foo = Struct.new(:one, :two, :three)
foo = Foo.new('a', 'b', 'c')
p Hash[foo.each_pair.to_a]
