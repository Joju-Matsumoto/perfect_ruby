require 'rack'

class SampleRackApplication
  def call(_env)
    [200, { 'Content-Type' => 'text/plain' }, %w[Hello world]]
  end
end

run SampleRackApplication.new
