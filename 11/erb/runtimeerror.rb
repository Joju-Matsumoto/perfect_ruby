require 'erb'

# hello = 'hellooooo'

path = File.join(__dir__, 'index.html.erb')
erb = ERB.new File.read(path)
erb.filename = path

puts erb.result binding
