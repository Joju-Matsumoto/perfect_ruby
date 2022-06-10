require 'logger'

log_levels = %i[DEBUG INFO WARN ERROR FATAL]

log_levels.each do |log_level|
  logger = Logger.new(File.join(__dir__, "#{log_level.to_s.downcase}.log"))

  # レベルの指定
  logger.level = Logger.const_get log_level

  # レベルを指定してログを出力
  logger.debug 'debug level log.'
  logger.info 'info level log.'
  logger.warn 'warn level log.'
  logger.error 'error level log.'
  logger.fatal 'fatal level log.'

  logger.close
end
