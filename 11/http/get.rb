require 'uri'
require 'net/https'

uri = URI.parse 'https://www.google.com/'
https = Net::HTTP.new uri.host, uri.port
# p https
https.use_ssl = true
https.start do
  res = https.get '/'
  puts res.body
end
