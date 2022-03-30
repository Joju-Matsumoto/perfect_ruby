require 'uri'
require 'net/http'

def fetch(uri, limit = 6)
  response = Net::HTTP.get_response(uri)

  case response.code.to_i
  when 200
    puts response.body
  when 301, 302
    if limit.nonzero?
      puts "Redirect to: #{response['Location']}"
      fetch URI.parse(response['Location']), limit.pred
    else
      response.value
    end
  else
    response.value
  end
end

uri = URI.parse('http://daily-goals.team-jj.com')

fetch uri
