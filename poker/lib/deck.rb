require_relative "card"

class Deck

    attr_reader :cards

    def self.create_deck 
        Deck.new(Card.get_all_cards)
    end

    def initialize(cards)
        @cards = cards
    end

    def shuffle
        cards.shuffle!
    end

    def add_cards(new_cards)
        cards.concat(new_cards)
        shuffle
    end

    def take_cards(n)
        raise "Not enough cards" if n > cards.length
        cards.take(n)
    end
end