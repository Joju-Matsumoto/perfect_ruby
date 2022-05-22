a = 'hello'

puts a.reverse

class String
  def reverse
    '<' + '-' * (length - 1) + "\n" + super
  end
end

puts a.reverse
