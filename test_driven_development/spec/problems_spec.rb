require 'rspec'
require 'problems'

describe Array do
    subject(:array) { Array.new(0) }
    describe '#my_uniq' do
        context 'when the length of the array is 0' do
            it 'should return an empty array' do
                expect(array.my_uniq).to eq([])
            end
        end
        context 'when array has all unique elements' do
            it 'should return the same array' do
                array = [1, 2, 3]
                expect(array.my_uniq).to eq(array)
            end
        end
        context 'when array has duplicate elements' do
            it 'should return the array with unique elements' do
                array = [1, 2, 1, 3, 3]
                expect(array.my_uniq).to eq([1, 2, 3])
            end
        end
    end

    describe "#two_sum" do
        context "when none of the elements sum to zero" do
            it "should return an empty array" do
                array = [0,1,2,3,5]
                expect(array.two_sum).to eq([])
            end
        end
        context "when some of the elements sum to zero" do
            array = [-1,0,2,-2,1]
            it "should return the array with pairs of positions that sum to zero" do
                expect(array.two_sum).to include([0,4],[2,3])
            end
            it "should be ordered" do
                expect(array.two_sum).to eq([[0,4],[2,3]])
            end
        end
    end

    describe "#my_transpose" do
        context "when given an empty array" do
            it "should return an empty array" do
                expect(array.my_transpose).to eq([])
            end
        end
        context "when given an n by n array" do
            it "should return the transposed array" do
                array = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]
                ]
                expect(array.my_transpose).to eq(array.transpose)
            end
        end
    end
end

describe "#stock_picker" do
    it "should raise an error if an array is not given" do
        expect {stock_picker("34")}.to raise_error(/Invalid/)
        expect {stock_picker()}.to raise_error(ArgumentError)
    end

    it "should not raise an error if array is given" do
        expect {stock_picker([])}.not_to raise_error
    end

    it "should correctly pick the most profitable pair of days" do
        array = [5,6,1,5,3,6]
        expect(stock_picker(array)).to eq([2,5])
    end

end