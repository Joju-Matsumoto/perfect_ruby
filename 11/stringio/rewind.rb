require 'stringio'

stringio = StringIO.new('Alice')
stringio.seek 0, IO::SEEK_END
stringio.write 'Bob'
stringio.rewind
p stringio.read
