require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
    @transaction = Transaction.new
  end

  def deposit(amt)
    @transaction.deposit(amt)
  end

  def withdraw(amt)
    @transaction.withdraw(amt)
  end

  def credit
    @transaction.credit
  end

  def debit
    @transaction.debit
  end

  private

  def display_time(time)
    time.strftime("%d/%m/%Y at %I:%M%p")
  end

end
