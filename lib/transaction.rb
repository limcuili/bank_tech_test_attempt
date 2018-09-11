class Transaction
  attr_reader  :credit

  def initialize
    @credit = 0
    @debit = 0
  end

  def deposit(amt)
    if amt.positive?
      @credit += amt
    else
      raise ArgumentError.new("Please deposit a positive amount.")
    end
  end
end
