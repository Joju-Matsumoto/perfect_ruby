class Single
  attr_reader :name

  @@instance

  def initialize
    @name = :joju
  end

  def self.instance
    @@instance ||= new
  end

  class << self
    private

    def new; end
  end
end

p Single.instance
