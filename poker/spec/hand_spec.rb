
require "rspec"
require "hand"


describe Hand do
    subject(:hand) { Hand.new }
    let(:card) { double("Card", :rank => 2, :suit => "C") }

    describe "#initialize" do
        it "should not take any arguments" do
            expect { Hand.new(3) }.to raise_error(ArgumentError)
            expect { Hand.new }.not_to raise_error 
        end
    end

    describe "#cards" do
        it "should return cards array" do
            expect(hand.cards).to be_a(Array)
        end
    end

    describe "#add_to_hand" do
        it "should add number of cards to the hand" do
            len = hand.cards.length
            hand.add_to_hand(["card", "card2"])
            expect(hand.cards.length).to be(len + 2)
        end
    end

    describe "#discard_cards" do
        context "when the number of cards to discard is <= 3" do
            it "should remove the cards given in the array" do
                arr = [card]
                hand.add_to_hand(arr)
                hand.discard_cards(arr)
                expect(hand.cards.length).to be(0)
            end
        end
        context "when the number of cards to discard is > 3" do
            it "should raise an error" do
                arr = [card] * 4
                expect { hand.discard_cards(arr) }.to raise_error("Can't discard more than 3")
            end
        end
    end     

end