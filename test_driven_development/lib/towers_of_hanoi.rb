


class TowersOfHanoi
    attr_accessor :piles
    def initialize(n)
        @piles = Array.new(3) { Array.new }
        n.step(1, -1).each do |i|
            @piles[0] << i
        end
    end

    def move(start_pos, end_pos)
        unless start_pos.between?(0, 2) && end_pos.between?(0, 2)
            raise "Nonexisting pile"
        end
        raise "Empty pile" if piles[start_pos].empty?
        if !piles[end_pos].empty?
            if piles[start_pos].last > piles[end_pos].last
                raise "Invalid move" 
            end
        end
        piles[end_pos] << piles[start_pos].pop
    end

    def won?
        return false unless piles[0].empty? && piles[1].empty?
        true
    end
end