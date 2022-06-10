Dir.glob(File.join(__dir__, '*.log*')).each do |file_path|
  File.delete file_path
end
