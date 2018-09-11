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
    @balance += amt
    single_transaction = {
      :date => display_time(Time.now),
      :credit => amt,
      :debit => nil,
      :balance => @balance
    }
    @transactions.push(single_transaction)
  end

  def withdraw(amt)
    @transaction.withdraw(amt)
    @balance -= amt
    single_transaction = {
      :date => display_time(Time.now),
      :credit => nil,
      :debit => amt,
      :balance => @balance
    }
    @transactions.push(single_transaction)
  end

  def positive_balance
    @transaction.credit
  end

  def amount_owed
    @transaction.debit
  end

  def show
    puts "  Date ||" + "  Credit ||" + "  Debit ||" + "  Balance "
    @transactions.reverse.each do |transaction|
      puts "  #{transaction[:date]} ||" +
        "  #{transaction[:credit]} ||" +
        "  #{transaction[:debit]} ||" +
        "  #{transaction[:balance]} "
    end
  end

  private

  def display_time(time)
    time.strftime("%d/%m/%Y at %I:%M%p")
  end

end
