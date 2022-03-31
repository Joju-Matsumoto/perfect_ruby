# == 人を表すクラス
#
# Author: joju
# Version: 0.0.1
# License: MIT
class Person
  # 名前
  attr_accessor :name
  # 年齢
  attr_reader :age

  #
  # このクラスのVersion
  #
  VERSION = '0.0.1'

  #
  # === initialize
  # コンストラクタ
  #
  def initialize(name, age)
    self.name = name
    self.age = age
    @accessor_name = 'hello'
  end

  class << self
    #
    # === singleton_method1
    #
    #
    def singleton_method1
      :singleton_method1
    end
  end

  #
  # === class_method1
  #
  def self.class_method1
    :class_method1
  end

  #
  # === instance_method1
  #
  # ==== Args
  # - options
  #   - Option のリスト
  #
  def instance_method1(options = [])
    # do something
  end

  #
  # === instance_method2
  #
  # :: a
  # :: b
  def instance_method2
    # do anything
  end

  private

  #
  # === private_method1
  # これは見えない
  #
  def private_method1 # :doc:
    # something wrong
  end
end
