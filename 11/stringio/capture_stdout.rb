require 'stringio'

def capture_stdout
  captured = StringIO.new
  original = $stdout
  $stdout = captured # 標準出力をStringIOオブジェクトにすり替える

  yield

  # 標準出力をもとにもどしてキャプチャーした文字列を返す
  $stdout = original
  captured.string
end

captured = capture_stdout do
  puts "hello world!"
end

p captured

