class Kernel
  def puts(*args)
    args.each do |arg|
      super(">> #{arg} <<")
    end
  end
end

puts 'hello', 'world'
