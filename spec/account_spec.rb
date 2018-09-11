# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { described_class.new }

  context 'on initialization of a new account' do
    describe '#balance' do
      it 'has zero balance' do
        expect(account.balance).to eq 0
      end
    end

    describe '#activity' do
      it 'has no activity' do
        expect(account.transactions).to match_array([])
      end
    end
  end

  describe '#deposit' do
    it 'pushes a deposit into the transactions array' do
      allow(Time).to receive(:now).and_return(Time.new(2018, 9, 11, 14, 52, 12))
      account.deposit(100)
      expect(account.transactions).to match_array([{
                                                    date: '11/09/2018 at 02:52PM',
                                                    credit: 100,
                                                    debit: nil,
                                                    balance: 100
                                                  }])
    end
  end

  describe '#withdraw' do
    it 'pushes a withdrawal into the transactions array' do
      allow(Time).to receive(:now).and_return(Time.new(2018, 9, 11, 14, 52, 12))
      account.withdraw(30)
      expect(account.transactions).to match_array([{
                                                    date: '11/09/2018 at 02:52PM',
                                                    credit: nil,
                                                    debit: 30,
                                                    balance: -30
                                                  }])
    end
  end

  describe '#positive_balance' do
    it 'shows your positive balance' do
      account.deposit(10)
      expect(account.positive_balance).to eq 10
    end
  end

  describe '#amount_owed' do
    it 'shows your negative balance' do
      account.withdraw(10)
      expect(account.amount_owed).to eq 10
    end
  end
end
