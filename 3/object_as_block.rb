module Puts
  module Color
    RED = 31
    GREEN = 32
    YELLOW = 33
    BLUE = 34
    PURPLE = 35
    CYAN = 36
    WHITE = 37
    BOLD = 1
    UNDERLINE = 4
  end

  class Colorizer
    def initialize(**dict)
      @dict = dict
    end

    def add(**dict)
      @dict.merge!(dict)
    end

    def to_proc
      # @param [String] s
      proc do |s|
        @dict.each_pair do |word, color|
          color = color.join(';') if color.is_a?(Array)
          s = s.gsub(/(#{word})/i) { "\033[#{color}m#{Regexp.last_match(1)}\033[0m" }
        end
        s
      end
    end
  end

  @@colorizer = Colorizer.new

  def self.add(**dict)
    @@colorizer.add(**dict)
  end

  refine Kernel do
    def puts(*args)
      super(args.map(&@@colorizer))
    end
  end
end

using Puts
Puts.add true: Puts::Color::GREEN, false: Puts::Color::YELLOW
Puts.add error: [Puts::Color::RED, Puts::Color::BOLD]
Puts.add none: [Puts::Color::BLUE]

puts 'this is true, really true!!', 'this is false', 'this is none'
puts 'hello True world!'
puts 'Error: something wrong!'
puts 'error: none is false. this is true.'
