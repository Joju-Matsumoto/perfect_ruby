require 'uri'
require 'net/http'

http = Net::HTTP.new('127.0.0.1', 3000)
request = Net::HTTP::Get.new('/')

request.basic_auth '', 'pass'
response = http.request(request)

p response.body
