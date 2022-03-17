require 'rspec'
require 'card'

describe Card do
    subject(:card) {Card.new(1,'H')}

    describe '#initialize' do 
        context 'when given valid arguments' do
            it 'should not raise an error' do 
                expect{Card.new(3,'C')}.not_to raise_error
            end
        end
        context 'when given invalid arguments' do 
            it 'should raise an error' do 
                expect {Card.new}.to raise_error
                expect {Card.new(14,'S')}.to raise_error(/Invalid Rank/)
                expect {Card.new(8,'B')}.to raise_error(/Invalid Suit/)
            end
        end
    end

    describe '#rank' do
        it 'should return the rank' do
            expect(card.rank).to be(1)
        end
    end

    describe '#suit' do
        it 'should return the suit' do
            expect(card.suit).to be('H')
        end
    end

    describe '#to_s' do
        it 'should return the string form of the card' do
            jack = Card.new(11,"S")
            queen = Card.new(12,"C")
            king = Card.new(13,"D")
            expect(card.to_s).to eq('A H')
            expect(jack.to_s).to eq('J S')
            expect(queen.to_s).to eq('Q C')
            expect(king.to_s).to eq('K D')
        end
    end
end