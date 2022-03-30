require 'erb'

include ERB::Util

# HTML用エスケープ
p ERB.new(%(<%= h('<script></script>') %>)).result binding
# URL用エスケープ
p ERB.new(%(<%= u('http://google.com/') %>)).result binding
