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
end