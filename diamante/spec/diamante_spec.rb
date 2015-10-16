# http://dojopuzzles.com/problemas/exibe/diamantes/

require 'diamante'

describe Diamante do

  describe "#valid?" do
    context 'valid arguments' do
      it { expect(Diamante.new('A')).to be_valid }
      it { expect(Diamante.new('a')).to be_valid }
      it { expect(Diamante.new('Z')).to be_valid }
      it { expect(Diamante.new('z')).to be_valid }
    end

    context 'invalid arguments' do
      it { expect(Diamante.new('AB')).to_not be_valid }
      it { expect(Diamante.new('ab')).to_not be_valid }
      it { expect(Diamante.new(123)).to_not be_valid }
      it { expect(Diamante.new(['A'])).to_not be_valid }
      it { expect(Diamante.new(2.5)).to_not be_valid }
    end
  end

  describe "#render" do

    context 'valid argument' do

      context 'letter E' do
        let(:rendered) { Diamante.new('E').render }

        it 'line 1' do
          expect(rendered[0]).to eq ['A', 0, 4]
        end
        it 'line 2' do
          expect(rendered[1]).to eq ['B', 1, 3]
        end
        it 'line 3' do
          expect(rendered[2]).to eq ['C', 3, 2]
        end
        it 'line 4' do
          expect(rendered[3]).to eq ['D', 5, 1]
        end
        it 'line 5' do
          expect(rendered[4]).to eq ['E', 7, 0]
        end
        it 'line 6' do
          expect(rendered[5]).to eq ['D', 5, 1]
        end
        it 'line 7' do
          expect(rendered[6]).to eq ['C', 3, 2]
        end
        it 'line 8' do
          expect(rendered[7]).to eq ['B', 1, 3]
        end
        it 'line 9' do
          expect(rendered[8]).to eq ['A', 0, 4]
        end
      end

      context 'letter C' do
        let(:rendered) { Diamante.new('C').render }

        it 'line 1' do
          expect(rendered[0]).to eq ['A', 0, 2]
        end
        it 'line 2' do
          expect(rendered[1]).to eq ['B', 1, 1]
        end
        it 'line 3' do
          expect(rendered[2]).to eq ['C', 3, 0]
        end
        it 'line 4' do
          expect(rendered[3]).to eq ['B', 1, 1]
        end
        it 'line 5' do
          expect(rendered[4]).to eq ['A', 0, 2]
        end
      end

      context 'invalid argument' do
        it { expect{ Diamante.new("AB").render }.to raise_error('The given argument is not a single letter!') }
        it { expect{ Diamante.new(123).render }.to raise_error('The given argument is not a single letter!') }
        it { expect{ Diamante.new(["A"]).render }.to raise_error('The given argument is not a single letter!') }
        it { expect{ Diamante.new({}).render }.to raise_error('The given argument is not a single letter!') }
      end
    end
  end
end
