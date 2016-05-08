def time_it
  time_before = Time.now
  yield if block_given?
  time_after = Time.now
  puts "block took #{time_after - time_before} seconds"
end

time_it { 100000000.times {} }
time_it { sleep(3) }
time_it { puts "hi" }
