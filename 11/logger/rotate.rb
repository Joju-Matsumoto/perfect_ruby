require 'logger'

logger = Logger.new(File.join(__dir__, 'rotate_log.log'), 3, 12)

10.times do |i|
  logger.info "perfect ruby #{i}."
end
