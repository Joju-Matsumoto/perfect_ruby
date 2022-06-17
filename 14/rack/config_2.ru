require 'rack'
require 'pp'

# Simple Rack Application
class RackApplication
  def call(env)
    pp env
    [200, { 'Content-Type' => 'text/plain' }, ['Hello Rack!']]
  end
end

run RackApplication.new
