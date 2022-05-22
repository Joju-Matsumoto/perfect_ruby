module MySupport
  class StringInquirer
    def initialize(str)
      @str = str
    end

    def method_missing(name, *args)
      return @str == name[..-2] if name[-1] == '?'

      super
    end

    def respond_to_missing?(name, *args)
      return true if name[-1] == '?'

      super
    end
  end
end

s = MySupport::StringInquirer.new('hello')
p s.hello?
p s.world?
