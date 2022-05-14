def human
  puts 'yield' while yield
end

def main
  count = 0
  human do
    count += 1
    true if count <= 5
  end
  puts count
end

main
