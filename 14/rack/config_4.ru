require 'rack'

class RackApplication
  def call(env)
    env
    response = Rack::Response.new('{"message": "Hello Rack!"}', 200, { 'Content-Type' => 'application/json' })

    response.finish
  end
end

use Rack::ShowStatus
use Rack::Auth::Basic do |name, pass|
  name == 'user' && pass == 'pass'
end

run RackApplication.new
