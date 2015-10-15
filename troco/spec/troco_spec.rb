# http://dojopuzzles.com/problemas/exibe/troco/

require 'troco'

describe Troco do

  describe "#valid?" do
    it { expect(Troco.new("100.50", 150)).to_not be_valid }
    it { expect(Troco.new([100.50], 150)).to_not be_valid }
    it { expect(Troco.new({ price: 100.50 }, 150)).to_not be_valid }
    it { expect(Troco.new(100, 150)).to be_valid }
    it { expect(Troco.new(100.0, 150.0)).to be_valid }
  end

  describe "#get" do

    context "invalid arguments" do
      context "not a number" do
        it { expect{ Troco.new("100.50", 150).get }.to raise_error('It is not a number!') }
        it { expect{ Troco.new([100.50], 150).get }.to raise_error('It is not a number!') }
        it { expect{ Troco.new({ price: 100.50 }, 150).get }.to raise_error('It is not a number!') }
      end

      context "negative values" do
        it { expect{ Troco.new(100.50, -150).get }.to raise_error('Negative values are not allowed!') }
        it { expect{ Troco.new(-100.50, 150).get }.to raise_error('Negative values are not allowed!') }
        it { expect{ Troco.new(-100.50, -150).get }.to raise_error('Negative values are not allowed!') }
      end

      context "not money enough" do
        it { expect{ Troco.new(100.50, 50).get }.to raise_error('Not money enough to buy it!') }
      end
    end

    context "valid arguments" do
      context "change in bank notes" do
        it 'should return 2 bank notes of $100' do
          troco = Troco.new(200,400)
          expect(troco.get).to eq [[2,100]]
        end

        it 'should return 1 bank note of $50' do
          troco = Troco.new(200,250)
          expect(troco.get).to eq [[1,50]]
        end

        it 'should return 3 bank notes of $10 and 1 of $5' do
          troco = Troco.new(50,85)
          expect(troco.get).to eq [[3,10], [1,5]]
        end
      end

      context "change in coins" do
        it 'should return 2 coins of 10 cents' do
          troco = Troco.new(0.50,0.70)
          expect(troco.get).to eq [[2,0.10]]
        end
        it 'should return 2 coins of 10 cents and 3 of 0.01' do
          troco = Troco.new(0.50,0.73)
          expect(troco.get).to eq [[2,0.10], [3,0.01]]
        end
      end

      context "change in bank notes and coins" do
        it 'should return 4 bank notes of $4 and 1 coin of 0.50' do
          troco = Troco.new(10.50,15)
          expect(troco.get).to eq [[4, 1.0], [1, 0.5]]
        end
        it 'should return 1 bank note of $10, 1 of $5 and 1 coin of 0.50' do
          troco = Troco.new(34.50,50)
          expect(troco.get).to eq [[1, 10.0], [1, 5.0], [1, 0.5]]
        end
      end

      context "when there is no charge" do
        it do
          troco = Troco.new(100, 100)
          expect(troco.get).to eq []
        end
        it do
          troco = Troco.new(15.50, 15.50)
          expect(troco.get).to eq []
        end
      end
    end
  end
end
