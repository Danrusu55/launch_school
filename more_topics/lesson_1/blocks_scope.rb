def call_me(some_code)
  some_code.call
end

name = "Bob"
chunk_of_code = Proc.new {puts "hi #{name}"}

name = "Joe"
call_me(chunk_of_code)
