require 'set'

class Array
    def my_uniq
        set = Set.new
        self.each do |ele|
            set.add(ele)
        end
        set.to_a
    end
end