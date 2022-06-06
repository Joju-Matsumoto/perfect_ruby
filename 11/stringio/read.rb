require 'stringio'

def read_upcase(io)
  io.read.upcase
end

io = open('|uname')
stringio = StringIO.new('alice')

p read_upcase(io)
p read_upcase(stringio)

