require 'benchmark'

n = 100_000

Benchmark.bm(15) do |x|
  x.report('without allocate') do
    s = String.new capacity: 0

    2_000.times do
      s << 'hello, world!'
    end
  end

  x.report('with allocate') do
    s = String.new capacity: 10_000

    2_000.times do
      s << 'hello, world!'
    end
  end
end

p :LOAD_MODULES
