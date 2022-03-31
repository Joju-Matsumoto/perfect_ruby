require 'rack'

# 自作ミドルウェア
# /admin へのアクセスを拒否する
class URLFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/admin'
      [
        404,
        { 'Content-Type' => 'text/plain' },
        ["Not Found.(PATH=#{env['PATH_INFO']})"]
      ]
    else
      @app.call(env)
    end
  end
end

# Rackアプリ
# PATHの情報を返す
class RackApplication
  def call(env)
    [
      200,
      { 'Content-Type' => 'text/plain' },
      ["RackApplication(PATH=#{env['PATH_INFO']})"]
    ]
  end
end

use URLFilter
run RackApplication.new
