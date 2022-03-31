require 'rack'

# Simple Rack Application
class RackApplication
  def call(_env)
    [200, { 'Content-Type' => 'text/plain' }, ['Hello Rack!']]
  end
end

Rack::Handler::WEBrick.run RackApplication.new
