require './app/lib/expression_tokenizer'
require './app/lib/token'

RSpec.describe ExpressionTokenizer do
  describe '#initialize' do
    subject = described_class.new('5*3+1+6-4/9*100')
    it "creates a new instance of #{described_class}" do
      expect(subject).to be_instance_of(ExpressionTokenizer)
    end
  end
  describe '#parse' do
    subject = described_class.new('5*3').parse
    context 'for the expression 5*3' do
      it 'returns an array of 3 tokens' do
        expect(subject).to be_an Array
        expect(subject.size).to eq 3
      end
      it 'correctly parses the tokens' do
        expected = [
          Token.new(:number, '5'),
          Token.new(:operator, '*'),
          Token.new(:number, '3')
        ]
        expect(subject).to eq expected
      end
    end
  end
end
