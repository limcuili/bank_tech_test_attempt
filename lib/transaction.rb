class Transaction
  MAX_DEBIT = 50
  attr_reader  :credit, :debit

  def initialize
    @credit = 0
    @debit = 0
  end

  def deposit(amt)
    amt = amt.round(2)
    if amt.positive?
      @credit += amt
    else
      raise ArgumentError.new("Please deposit a positive amount.")
    end
  end

  def withdraw(amt)
    amt = amt.round(2)
    if amt < @credit
      @credit -= amt
    elsif amt == @credit
      @credit = 0
    elsif amt < (@credit + MAX_DEBIT - @debit)
      @debit += amt - @credit
      @credit = 0
    else
      raise ArgumentError.new("Error: Unable to withdraw over £#{MAX_DEBIT} of your current credit (£#{@credit}).")
    end
  end

end
