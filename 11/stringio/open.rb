require 'stringio'

res = StringIO.open 'hello, world!', 'w' do |io|
  # puts io.read
  io.write 'foo'
end

puts res

