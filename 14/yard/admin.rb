class Admin
  @@instance = new

  # シングルトンインスタンスを返す
  def self.instance
    @@instance
  end

  # アドミンの名前
  attr_reader :name

  private

  # @param [String] name 名前
  def initialize(name)
    @name = name
  end

  private_class_method :new, :allocate
end
