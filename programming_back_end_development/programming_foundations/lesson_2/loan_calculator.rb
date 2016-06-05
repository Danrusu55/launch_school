# loan_calculator.rb

def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt "Enter the amount you would like to borrow."
  loan_amount = gets.chomp.to_f

  prompt "Enter the interest rate (5% = 5)."
  monthly_interest_rate = (gets.chomp.to_f / 100) / 12.0

  prompt "Enter the length of your loan in months."
  loan_time = gets.chomp.to_i

  prompt "Working out the monthly repayments on a $#{loan_amount},"
  prompt "paid over #{loan_time} months at #{monthly_interest_rate}% monthly interest rate."

  monthly_repayments = loan_amount * (monthly_interest_rate * ((1 +  monthly_interest_rate)**loan_time)) / ((((1 + monthly_interest_rate)**loan_time) - 1))

  prompt "Your monthly repayments will be #{monthly_repayments},"
  prompt "for a period of #{loan_time} months."
  prompt "Total amount to be repaid will be #{monthly_repayments * loan_time}."

  prompt "Would you like to make another calculation."
  prompt "Make your selection (y - yes or n - no)?"

  selection = gets.chomp
  break if selection.casecmp != 'y'
end

prompt "Thank you for using the loan calculator."

# Add demo of pull request for github practice