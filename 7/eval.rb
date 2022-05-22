module M
  def puts(*args)
    super(args.map { |arg| "> #{arg}" })
  end
end

Kernel.prepend M

puts 'a', 'b'
p M.singleton_class.ancestors
p Kernel.ancestors
p Kernel.singleton_class.ancestors
