require 'benchmark'

n = 100_000

Benchmark.benchmark Benchmark::CAPTION, 7, Benchmark::FORMAT, '>total:', '>avg:' do |x|
  f = x.report('for') do
    for i in 1..n
      val = 'value'
    end
  end

  w = x.report 'while' do
    i = 1
    while i <= n
      val = 'value'
      i += 1
    end
  end

  t = x.report 'times' do
    n.times do
      val = 'value'
    end
  end

  total = f + w + t
  avg = total / 3

  [total, avg]
end
