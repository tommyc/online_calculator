require './app/lib/token'

RSpec.describe Token do
  subject_number = described_class.new(:number, '5')
  subject_operator = described_class.new(:operator, '*')
  describe '#initialize' do
    it "creates a new instance of #{described_class}" do
      expect(subject_number).to be_instance_of(Token)
    end
  end
  describe '#value' do
    context 'when created with a number' do
      it 'returns the number as a Float' do
        expect(subject_number.value).to eq 5.0
        expect(subject_number.value).to be_a(Float)
      end
    end
    context 'when created with an operator' do
      it 'returns an operator as a String' do
        expect(subject_operator.value).to eq '*'
        expect(subject_operator.value).to be_a(String)
      end
    end
  end
  describe '#priority' do
    context 'when the operator is + or -' do
      it 'returns a priority of 1' do
        expect(described_class.new(:operator, '+').priority).to eq 1
        expect(described_class.new(:operator, '-').priority).to eq 1
      end
    end
    context 'when the operator is a * or /' do
      it 'returns a priority of 2' do
        expect(described_class.new(:operator, '*').priority).to eq 2
        expect(described_class.new(:operator, '/').priority).to eq 2
      end
    end
  end
end
