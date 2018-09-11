class Transaction
  MAX_DEBIT = 50
  attr_reader  :credit, :debit

  def initialize
    @credit = 0
    @debit = 0
  end

  def deposit(amt)
    fail ArgumentError.new("Please deposit a positive amount.") if amt.negative?
    amt = amt.round(2)
    @credit += amt
  end

  def withdraw(amt)
    amt = amt.round(2)
    if amt < @credit
      @credit -= amt
    elsif amt == @credit
      @credit = 0
    elsif amt <= (@credit + MAX_DEBIT - @debit)
      @debit += amt - @credit
      @credit = 0
    else
      raise ArgumentError.new("Error: Unable to have a debit over £#{MAX_DEBIT}. Your current credit is £#{@credit}.")
    end
  end

end
