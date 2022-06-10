require 'uri'
require 'net/https'

def fetch(uri, limit = 6)
  https = Net::HTTP.new uri.host, uri.port
  https.use_ssl = true
  https.start do
    res = https.get uri.path

    case res.code.to_i
    when 200
      puts res.body
    when 301, 302
      if limit.zero?
        res.value
      else
        puts 'follow redirect'
        fetch URI.parse(res['Location']), limit.pred
      end
    else
      res.value
    end
  end
end

uri = URI.parse 'https://google.com/'
fetch uri
