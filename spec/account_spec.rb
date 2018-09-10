require 'account'

describe Account do
  let(:new_account) { described_class.new }

  context 'on initialization of a new account' do
    describe '#balance' do
      it 'has zero balance' do
        expect(new_account.balance).to eq 0
      end
    end

    describe '#activity' do
      it 'has no activity' do
        expect(new_account.activity).to match_array([])
      end
    end
  end

end
