def batch
  5.times do |i|
    system 'sleep 1'
    puts i
  end
  puts 'done'
end

def concurrent
  pids = []
  10.times do
    pid = spawn 'sleep 2'
    pids << pid
  end
  # pids.each_with_index do |pid, i|
  #   Process.wait pid
  #   puts i
  # end
  Process.waitall
  puts 'done'
end

# concurrent
batch
