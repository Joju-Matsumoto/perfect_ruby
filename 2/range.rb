class Counter
  include Enumerable
  attr_reader :count

  def initialize(count = 0)
    @count = count
  end

  def succ
    Counter.new(@count + 1)
  end

  def <=>(other)
    @count - other.count
  end
end

(Counter.new(0)..Counter.new(5)).each do |counter|
  p counter
end
