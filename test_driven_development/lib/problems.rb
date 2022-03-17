require 'set'

class Array
    def my_uniq
        set = Set.new
        self.each do |ele|
            set.add(ele)
        end
        set.to_a
    end
    def two_sum
        result = []
        hash = Hash.new() {|h,k| h[k] = Array.new()}
        self.each_with_index do |ele, i|
            if hash.has_key?(-ele)
                hash[-ele].each do |index|
                    result << [index,i]
                end
            end
            hash[ele] << i
        end
        result.sort! do |arr1,arr2|
            compare = arr1[0] <=> arr2[0]
            if compare == 0
                arr1[1] <=> arr2[1]
            else
                compare
            end
        end
    end

    def my_transpose
        arr = Array.new(length) { Array.new(length) }
        (0...length).each do |i|
            (0...length).each do |j|
                arr[i][j] = self[j][i]
            end
        end
        arr
    end

end

def stock_picker(days)
    raise "Invalid Argument" unless days.is_a?(Array)
    min_index = 0
    max_profit = -1000
    max_pair = [0,0]
    days.each_with_index do |day,i|
        if day < days[min_index]
            min_index = i
        end
        curr_profit = day-days[min_index]
        if curr_profit > max_profit
            max_profit = curr_profit
            max_pair = [min_index,i]
        end
    end
    return max_pair
end