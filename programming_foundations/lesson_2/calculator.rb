# calculator.rb

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operator_to_string(op)
  case op
  when '1'
    "adding"
  when '2'
    "subtracting"
  when '3'
    "multiplying"
  when '4'
    "dividing"
  end
end

prompt("Welcome to the Calculator! Please enter your name.")

name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt("Make sure you add your name...")
  else
    break
  end
end

prompt("Hi #{name}")

loop do

  number1 = ""
  loop do
  prompt("What's the first number?")
  number1 = Kernel.gets().chomp()

    if valid_number?(number1)
       break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  number2 = ""
  loop do

  prompt("What's the second number?")
  number2 = Kernel.gets().chomp()

    if valid_number?(number2)
       break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG 
  What operation would you like to perform? 
    1 - add
    2 - subtract 
    3 - multiply 
    4 - divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Try inputing: 1 - to add, 2 - to subtract, 3 - to multiply, 4 - to divide.")
    end
  end

  prompt("#{operator_to_string(operator)} your two numbers . . .")

  result = case operator.to_i
            when 1
              result = number1.to_f + number2.to_f
            when 2
              result = number1.to_f() - number2.to_f()
            when 3
              result = number1.to_f() * number2.to_f()
            when 4
              result = number1.to_f() / number2.to_f()
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation (y - to continue)?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt("Thanks for using the calculator...see ya!")