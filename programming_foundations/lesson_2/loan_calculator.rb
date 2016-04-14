# loan_calculator.rb

loop do

  puts "Enter the amount you would like to borrow."
  loan_amount = gets.chomp.to_f

  puts "Enter the interest rate (5% = 5)."
  interest_rate = gets.chomp.to_f/100

  puts "Enter the length of your loan in months."
  loan_time = gets.chomp.to_i

  puts "Working out the monthly repayments on a $#{loan_amount},"
  puts "paid over #{loan_time} months at #{interest_rate}% interest."

  monthly_repayments = loan_amount * ( interest_rate * ( ( 1 + interest_rate ) ** interest_rate ) ) / 
  ( ( ( ( 1 + interest_rate ) ** interest_rate ) - 1 ) )

  puts "Your monthly repayments will be #{monthly_repayments},"
  puts "for a period of #{loan_time} months."
  puts "Total amount to be repaid will be #{monthly_repayments * loan_time}."

  puts "Would you like to make another calculation."
  puts "Make your seleciton (y - yes or n - no)?"

  selection = ''
  unless selection.downcase = 'y'
    break
  end

end

puts "Thank you for using the loan calculator."