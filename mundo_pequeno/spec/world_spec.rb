# http://dojopuzzles.com/problemas/exibe/um-mundo-pequeno/

require 'world'

describe World do

  describe "#compute_3_closest_friends" do

    context 'invalid arguments' do
      context 'argument different from Array' do
        describe 'when string' do
          it { expect{ World.new("Hello world!") }.to raise_error('It expects an Array!') }
        end
        describe 'when integer' do
          it { expect{ World.new(1234) }.to raise_error('It expects an Array!') }
        end
      end

      describe 'Array less than 4 elements' do
        it { expect{ World.new([]) }.to raise_error('It expects 4 or more points!') }
        it { expect{ World.new([[0,0], [1,1]]) }.to raise_error('It expects 4 or more points!') }
      end

      describe 'Array with repeated points' do
        it { expect{ World.new([[1,1], [1,1], [1,1], [1,1], [1,1], [1,1]]) }.to raise_error('Repeated points are not allowed!') }
        it { expect{ World.new([[0,0], [1,1], [2,2], [3,3], [4,4], [0,0]]) }.to raise_error('Repeated points are not allowed!') }
      end
    end

    context 'valid arguments' do
      context '[[1,1], [1,3], [1,6], [1,10], [1,15], [1,21]]' do
        context '3 closest friends' do
          let(:result) do
            World.new([[1,1], [1,3], [1,6], [1,10], [1,15], [1,21]]).compute_3_closest_friends
          end

          describe 'of [1,1]'  do
            it { expect(result[[1,1]]).to eq [[[1, 3], 2.0], [[1, 6], 5.0], [[1, 10], 9.0]] }
          end

          describe 'of [1,3]'  do
            it { expect(result[[1,3]]).to eq [[[1, 1], 2.0], [[1, 6], 3.0], [[1, 10], 7.0]] }
          end

          describe 'of [1,6]'  do
            it { expect(result[[1,6]]).to eq [[[1, 3], 3.0], [[1, 10], 4.0], [[1, 1], 5.0]] }
          end

          describe 'of [1,10]'  do
            it { expect(result[[1,10]]).to eq [[[1, 6], 4.0], [[1, 15], 5.0], [[1, 3], 7.0]] }
          end

          describe 'of [1,15]'  do
            it { expect(result[[1,15]]).to eq [[[1, 10], 5.0], [[1, 21], 6.0], [[1, 6], 9.0]] }
          end

          describe 'of [1,21]'  do
            it { expect(result[[1,21]]).to eq [[[1, 15], 6.0], [[1, 10], 11.0], [[1, 6], 15.0]] }
          end
        end
      end


      context '[[0,0], [1,1], [2,2], [3,3], [4,4], [5,5]]' do
        context '3 closest friends' do
          let(:result) do
            World.new([[0,0], [1,1], [2,2], [3,3], [4,4], [5,5]]).compute_3_closest_friends
          end

          describe 'of [0,0]'  do
            it { expect(result[[0,0]]).to eq [[[1, 1], 1.4142135623730951], [[2, 2], 2.8284271247461903], [[3, 3], 4.242640687119285]] }
          end

          describe 'of [1,1]'  do
            it { expect(result[[1,1]]).to eq [[[0, 0], 1.4142135623730951], [[2, 2], 1.4142135623730951], [[3, 3], 2.8284271247461903]] }
          end

          describe 'of [2,2]'  do
            it { expect(result[[2,2]]).to eq [[[1, 1], 1.4142135623730951], [[3, 3], 1.4142135623730951], [[0, 0], 2.8284271247461903]]  }
          end

          describe 'of [3,3]'  do
            it { expect(result[[3,3]]).to eq [[[2, 2], 1.4142135623730951], [[4, 4], 1.4142135623730951], [[1, 1], 2.8284271247461903]] }
          end

          describe 'of [4,4]'  do
            it { expect(result[[4,4]]).to eq [[[3, 3], 1.4142135623730951], [[5, 5], 1.4142135623730951], [[2, 2], 2.8284271247461903]] }
          end

          describe 'of [5,5]'  do
            it { expect(result[[5,5]]).to eq [[[4, 4], 1.4142135623730951], [[3, 3], 2.8284271247461903], [[2, 2], 4.242640687119285]] }
          end
        end
      end
    end

  end

end
