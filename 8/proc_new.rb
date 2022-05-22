def proc_factory
  proc
end

pr = proc_factory { puts 'hello proc' }
pr.call
