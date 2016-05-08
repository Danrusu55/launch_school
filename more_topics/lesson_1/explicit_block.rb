def test(&block)
  puts "What is &block? #{block}"
end

test { sleep(0.5) }
