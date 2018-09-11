require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new }

  describe '#deposit' do
    it 'is able to take in positive deposit' do
      transaction.deposit(20)
      expect(transaction.credit).to eq 20
    end

    it 'raises an error if you attempt to deposit a negative amount' do
      expect{ transaction.deposit(-10) }.to raise_error(ArgumentError)
    end

  end

end
