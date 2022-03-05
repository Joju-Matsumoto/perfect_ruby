require 'fiber'

f1 = Fiber.new {
  :f1
}

f2 = Fiber.new {
  f1.transfer
  :f2 # WTF
}

p f2.resume
