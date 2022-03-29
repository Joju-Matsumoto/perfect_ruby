# クラス変数を使ったカウンター
class InstanceCounter
  @instance_count = 0

  class << self
    attr_reader :instance_count
  end

  def initialize
    self.class.instance_eval do
      @instance_count += 1 if @instance_count
    end
  end
end

p InstanceCounter.instance_count  # => 0

5.times do
  c = InstanceCounter.new
end

p InstanceCounter.instance_count  # => 5

class InheritedInstanceCounter < InstanceCounter
end

# 継承したクラスでnew
5.times do
  c = InheritedInstanceCounter.new
end

p InheritedInstanceCounter.instance_count # => nil
p InstanceCounter.instance_count          # => 5

# クラスインスタンス変数を使ったカウンター
