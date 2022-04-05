require_relative './addr'

raise 'Assertion failed' unless Addr.execute(1, 2) == 3
raise 'Assertion failed' unless Addr.execute(2, 2) == 4
raise 'Assertion failed' unless Addr.execute(1, -2) == -1

puts 'ok'
