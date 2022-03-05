require 'fiber'

p fr = Fiber.new { Fiber.current }
p fr_current = fr.resume

p fr == fr_current

p Fiber.current == fr_current
