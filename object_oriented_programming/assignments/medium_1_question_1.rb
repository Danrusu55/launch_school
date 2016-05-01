class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end
  def positive_balance?
    balance >= 0
  end
end

balance = BankAccount.new(10)

puts balance.positive_balance?
