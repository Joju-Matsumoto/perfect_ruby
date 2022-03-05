require 'fiber'

fr = Fiber.new { Fiber.yield }

p fr.alive?

fr.resume

p fr.alive?

fr.resume

p fr.alive?
