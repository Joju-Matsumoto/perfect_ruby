a = begin
  :begin
  :begin_if if true
rescue StandardError
    else
      :else
      :else_if if false
end

p a
