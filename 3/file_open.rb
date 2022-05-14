class MyFile
  def self.open(filepath, mode = :r)
    file = new(filepath, mode)

    if block_given?
      yield file
      file.close
    end

    file
  end

  def initialize(filepath, mode = :r)
    puts "open #{filepath} as #{mode} mode"
    @filepath = filepath
    @mode = mode
  end

  def close
    puts "close file #{@filepath}"
  end
end

file = MyFile.open 'hello'
p file
file.close

MyFile.open 'world', :w do |file|
  p file
end
