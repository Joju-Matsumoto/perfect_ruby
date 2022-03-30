require 'logger'

logger = Logger.new('11/logger/logs/sample.log', 5, 1000, level: Logger::INFO, progname: 'sample.rb')
# logger.level = Logger::INFO
# logger.progname = 'perfect_ruby.rb'

1000.times do
  logger.info 'info level log.'
  logger.debug 'debug level log.'
end

logger.close
