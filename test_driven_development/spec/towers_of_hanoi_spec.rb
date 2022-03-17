
require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
    subject(:tower) { TowersOfHanoi.new(3) }
    # [[3, 2, 1],
    # [],
    # []]

    describe "#piles" do
        it 'should exist' do
            expect { tower.piles }.not_to raise_error
        end
    end

    describe "#piles=" do
        it 'should set piles to a given array' do
            expect { tower.piles = [] }.not_to raise_error
        end
    end

    describe "#initialize" do
        it 'should receive a number' do
            expect{ TowersOfHanoi.new }.to raise_error(ArgumentError)
            expect{ TowersOfHanoi.new(3) }.not_to raise_error
        end
        it 'should create three arrays' do
            expect(tower.piles.length).to eq(3)
        end
        it 'should fill the first pile with n disks' do
            expect(tower.piles[0].length).to eq(3)
            expect(tower.piles[1].length).to eq(0)
            expect(tower.piles[2].length).to eq(0)
        end
        it 'should fill the first pile in descending order' do
            expect(tower.piles[0]).to eq([3, 2, 1])
        end
    end

    describe "#move" do
        context 'when the starting and ending position are valid' do
            it 'should move the disk from start to end position' do
                tower.move(0, 1)
                expect(tower.piles[0]).to eq([3, 2])
                expect(tower.piles[1]).to eq([1])
            end
        end
        context 'when trying to move a bigger disk onto smaller disk' do
            it 'should raise an error' do
                tower.move(0,1)
                expect {tower.move(0,1)}.to raise_error(/Invalid/)
            end
        end
        context 'when trying to move from or to nonexisting pile' do
            it 'should raise an error' do 
                expect {tower.move(-1,0)}.to raise_error(/Nonexisting/)
                expect {tower.move(0,4)}.to raise_error(/Nonexisting/)
            end
        end
        context 'when trying to move an empty pile' do
            it 'should raise an error' do 
                expect {tower.move(1,2)}.to raise_error(/Empty/)
            end
        end
    end

    describe '#won?' do

        context 'when all disks have been moved to the third pile' do
            it 'should return true' do
                tower.piles = [[],[],[3,2,1]]
                expect(tower.won?).to be(true)                
            end
        end
        context 'when not all of the disks have been moved to the third pile' do
            it 'should return false' do
                tower.piles = [[],[1],[3,2]]
                expect(tower.won?).to be(false)                
            end
        end
    end
end
