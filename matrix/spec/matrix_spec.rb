require 'matrix'

describe Matrix do

	context "When 'max' is called  more than once" do
		let(:matrix) do
			Matrix.new([
				[1,1,1,1,2],
				[1,1,1,1,2],
				[1,1,1,1,2],
				[1,1,1,1,2],
				[1,1,1,1,2]
			])
		end
		before { allow_any_instance_of(Array).to receive(:flatten).and_return(spy("Array")) }
		it 'does not calculates again' do
			expect_any_instance_of(Array).to receive(:flatten).once
			2.times { matrix.max }
		end
	end

	context "When the greatest product results from a line" do
		let(:matrix) do
			Matrix.new([
				[2, 2, 2, 2, 2],
				[1, 1, 1, 1, 1],
				[1, 1, 1, 1, 1],
				[1, 1, 1, 1, 1],
				[1, 1, 1, 1, 1]
			])
		end

		describe "#product_line" do
			it { expect(matrix.product_line(0)).to eq 32 }
			it { expect(matrix.product_line(1)).to eq 1 }
			it { expect(matrix.product_line(2)).to eq 1 }
			it { expect(matrix.product_line(3)).to eq 1 }
			it { expect(matrix.product_line(4)).to eq 1 }
		end

		describe "#product_column" do
			it { expect(matrix.product_column(0)).to eq 2 }
			it { expect(matrix.product_column(1)).to eq 2 }
			it { expect(matrix.product_column(2)).to eq 2 }
			it { expect(matrix.product_column(3)).to eq 2 }
			it { expect(matrix.product_column(4)).to eq 2 }
		end

		describe "#max" do
			it { expect(matrix.max).to eq 32 }
		end

	end

	context "When the greatest product results from a column" do
		let(:matrix) do
			Matrix.new([
				[1, 1, 2, 1, 1],
				[1, 1, 2, 1, 1],
				[1, 1, 2, 1, 1],
				[1, 1, 2, 1, 1],
				[1, 1, 2, 1, 1]
			])
		end

		describe "#product_line" do
			it { expect(matrix.product_line(0)).to eq 2 }
			it { expect(matrix.product_line(1)).to eq 2 }
			it { expect(matrix.product_line(2)).to eq 2 }
			it { expect(matrix.product_line(3)).to eq 2 }
			it { expect(matrix.product_line(4)).to eq 2 }
		end

		describe "#product_column" do
			it { expect(matrix.product_column(0)).to eq 1 }
			it { expect(matrix.product_column(1)).to eq 1 }
			it { expect(matrix.product_column(2)).to eq 32 }
			it { expect(matrix.product_column(3)).to eq 1 }
			it { expect(matrix.product_column(4)).to eq 1 }
		end

		describe "#max" do
			it { expect(matrix.max).to eq 32 }
		end

	end

	context "When the greatest product results from the main diagonal" do
		let(:matrix) do
			Matrix.new([
				[2, 1, 1, 1, 1],
				[1, 2, 1, 1, 1],
				[1, 1, 2, 1, 1],
				[1, 1, 1, 2, 1],
				[1, 1, 1, 1, 2]
			])
		end

		describe "#max" do
			it { expect(matrix.max).to eq 32 }
		end
	end

	context "When the greatest product results from the secondary diagonal" do
		let(:matrix) do
			Matrix.new([
				[1, 1, 1, 1, 2],
				[1, 1, 1, 2, 1],
				[1, 1, 2, 1, 1],
				[1, 2, 1, 1, 1],
				[2, 1, 1, 1, 1]
			])
		end

		describe "#max" do
			it { expect(matrix.max).to eq 32 }
		end
	end

end
