class A
  def initialize
    
  end
  puts 'try to define A'
  @@count ||= 0
  puts "@@count = #{@@count}"
  raise 'something wrong!' if @@count < 3
rescue StandardError
  @@count += 1
  puts "rescue: #{@@count}"
  p A
  retry if @@count < 4
end

a = A.new
p a
