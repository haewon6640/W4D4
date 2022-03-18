require 'rspec'
require 'deck'

describe Deck do   
    let(:card) {double("Card", :get_all_cards => [])}
    subject(:deck) {Deck.new([card]*52)}

    describe "::create_deck" do
        it 'should return a new deck' do
            expect(Deck.create_deck).to be_a(Deck)    
        end
        it 'should call get all cards' do
            expect(Card).to receive(:get_all_cards)
            Deck.create_deck
        end
    end

    describe "#cards" do
        it 'should return array of cards' do
            expect(deck.cards).to be_a(Array)
        end
    end
    describe "#initialize" do
        it 'should receive a list of cards' do
            expect { Deck.new([]) }.not_to raise_error
            expect { Deck.new([card]) }.not_to raise_error
        end
        it 'should store the list in cards' do
            arr = [card]
            deck = Deck.new(arr)
            expect(deck.cards).to be(arr)
        end
    end

    describe "#shuffle" do
        it 'should call shuffle on cards array' do
            expect(deck.cards).to receive(:shuffle!)
            deck.shuffle
        end
    end

    describe "#add_cards" do
        it 'should add the cards to the deck' do
            len = deck.cards.length
            added_cards = [card]*3
            deck.add_cards(added_cards)
            expect(deck.cards.length).to be(len+3)
        end
        it 'should shuffle the deck after' do
            expect(deck).to receive(:shuffle)
            deck.add_cards([])
        end
    end
    
    describe "#take_cards" do
        context "when there are enough cards in the deck" do
            it 'should receive a number' do
                expect {deck.take_cards(2)}.not_to raise_error
                expect {deck.take_cards}.to raise_error(ArgumentError)
            end

            it 'should return n cards' do
                expect(deck.take_cards(5).length).to be(5)
            end
        end
        
        context "when there are not enough cards in the deck" do
            it 'should raise an error' do
                expect {deck.take_cards(53)}.to raise_error(/Not enough/)
            end
        end
    end


end