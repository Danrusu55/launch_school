# calculator.rb

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

# Message variables
welcome_message = "Welcome to the Calculator! Please enter your name."
name_error_message = "Make sure you add your name..."
hello_message = "Hi "
get_number_1 = "What's the first number?"
number_input_error = "Hmm... that doesn't look like a valid number."
get_number_2 = "What's the second number?"
  operator_prompt = <<-MSG 
  What operation would you like to perform? 
    1 - add
    2 - subtract 
    3 - multiply 
    4 - divide
  MSG
operator_error_message = "Try inputing: 1 - to add, 2 - to subtract, 3 - to multiply, 4 - to divide."
working_message = " your two numbers . . ."
result_message = "The result is "
continue_message = "Do you want to perform another calculation (y - to continue)?"
goodbye_message = "Thanks for using the calculator...see ya!"


def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_f.to_s == num.to_s || num.to_i.to_s == num.to_s
end

def operator_to_string(op)
  operation_message = ''
  case op
  when '1'
    operation_message = "adding"
  when '2'
    operation_message = "subtracting"
  when '3'
    operation_message = "multiplying"
  when '4'
    operation_message = "dividing"
  end
  operation_message
end

prompt(welcome_message)

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt(name_error_message)
  else
    break
  end
end

prompt(hello_message + name)

loop do

  number1 = ""
  loop do
  prompt(get_number_1)
  number1 = gets.chomp

    if valid_number?(number1)
       break
    else
      prompt(number_input_error)
    end
  end

  number2 = ""
  loop do

  prompt(get_number_2)
  number2 = gets.chomp

    if valid_number?(number2)
       break
    else
      prompt(number_input_error)
    end
  end

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(operator_error_message)
    end
  end

  prompt("#{operator_to_string(operator)}" + working_message)

  result = case operator.to_i
            when 1
              result = number1.to_f + number2.to_f
            when 2
              result = number1.to_f - number2.to_f
            when 3
              result = number1.to_f * number2.to_f
            when 4
              result = number1.to_f / number2.to_f
  end

  prompt(result_message + "#{result}")

  prompt(continue_message)
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt(goodbye_message)