# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new }

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'is able to take in positive deposit' do
      transaction.deposit(20)
      expect(transaction.credit).to eq 20
    end

    it 'raises an error if you attempt to deposit a negative amount' do
      expect { transaction.deposit(-10) }.to raise_error(ArgumentError)
    end

    it 'ensures that we deposit to 2 decimal places' do
      transaction.deposit(1.99999999)
      expect(transaction.credit).to eq 2.00
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    context 'an account that has deposited £50' do
      before do
        transaction.deposit(50)
      end

      it 'ensures that we withdraw to 2 decimal places' do
        transaction.withdraw(1.99999999)
        expect(transaction.credit).to eq 48.00
      end

      it 'is able to withdraw the full amount of credit' do
        transaction.withdraw(50)
        expect(transaction.credit).to eq 0
        expect(transaction.debit).to eq 0
      end

      it 'is able to withdraw less than the full amount of credit' do
        transaction.withdraw(15)
        expect(transaction.credit).to eq 50 - 15
      end

      it 'is able to withdraw more than the current credit' do
        transaction.withdraw(60)
        expect(transaction.credit).to eq 0
        expect(transaction.debit).to eq 10
      end

      max_debit = Transaction::MAX_DEBIT
      it 'is unable to withdraw more than the max limit' do
        expect { transaction.withdraw(max_debit + 51) }.to raise_error "Error: Unable to have a debit over £#{max_debit}. Your current credit is £#{transaction.credit}."
      end
    end
  end
end
