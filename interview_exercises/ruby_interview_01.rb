# The program will first randomly pick a number between 1 and 100. The program will then ask the user to guess the number. If the user guesses correctly, the program will end. If the user guessed too high or low, the program will respond with "Your number is to high" or "Your number is to low" respectively, and allow the user to guess again. After finally guessing the number, the program will display how many guesses the user took to guess the number.

puts "Guess the number I have chosen, I will help you out."

random_number = rand(1..100)

count = 0

loop do
  print "What is your guess : "
  guess = gets.chomp.to_i
  count += 1
  if guess == random_number
    break
  elsif guess > random_number
    puts "Your number is too high"
  else
    puts "Your number is too low"
  end
end

puts "Well done, it took you #{count} tries to guess the number.\nGood bye."
