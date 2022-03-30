require 'erb'

# def hello
#   :hello_world
# end

path = './11/erb/index.html.erb'
erb = ERB.new(File.read(path))
erb.filename = path # これをつけておくとエラー表示の際にファイルが表示されるので便利
erb.run binding
