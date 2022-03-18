
class Card
    attr_reader :rank, :suit

    RANK_MAP = {
        1 => "A",
        11 => "J",
        12 => "Q",
        13 => "K"
    }.freeze

    SUITS = %w(S D C H)
    RANKS = (1..13).to_a

    def self.get_all_cards
        result = []
        RANKS.each do |rank|
            SUITS.each do |suit|
                result << Card.new(rank, suit)
            end
        end
        result
    end

    def initialize(rank, suit)
        raise "Invalid Rank" unless rank.between?(1, 13)
        raise "Invalid Suit" unless SUITS.include?(suit)
        @rank = rank
        @suit = suit
    end

    def to_s
        rank_string = RANK_MAP.has_key?(rank) ? RANK_MAP[rank] : rank.to_s
        "#{rank_string} #{suit}"
    end



end