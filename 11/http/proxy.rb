require 'webrick'
require 'webrick/httpproxy'

proxy = WEBrick::HTTPProxyServer.new(
  BindAddress: '127.0.0.1',
  Port: 8080,
  ProxyContentHandler: lambda { |_req, res|
    puts :hello
    puts res.body
    begin
      puts res.body.scan(%r{<title>(.*)</title>}mi)
    rescue StandardError
      nil
    end
  }
)

Signal.trap('INT') do
  proxy.shutdown
end

proxy.start
