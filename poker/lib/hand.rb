class Hand
    
    attr_reader :cards

    def initialize
        @cards = []
    end

    def add_to_hand(cards_arr) 
        cards.concat(cards_arr)
    end

    def discard_cards(cards_arr)
        raise "Can't discard more than 3" if cards_arr.length > 3
        until cards_arr.empty? do
            card = cards_arr.pop
            cards.delete_at(cards.index(card))
        end
    end
end