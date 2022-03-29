# クラス変数を使ったカウンター
class InstanceCounter
  @@instance_count = 0

  def self.instance_count
    @@instance_count
  end

  def initialize
    @@instance_count += 1
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

p InheritedInstanceCounter.instance_count # => 10
p InstanceCounter.instance_count          # => 10

# クラスインスタンス変数を使ったカウンター
