require 'mictorio'

describe Mictorio do

	context "when only the first position is availiable" do
		let(:mictorio) { Mictorio.new([0,0,1,0]) }
		
		describe "#cabe_mijao?" do
			context "when valid values" do
				it { expect(mictorio.cabe_mijao?(0)).to be_truthy }
				it { expect(mictorio.cabe_mijao?(1)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(2)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(3)).to be_falsy }
			end
			context "when invalid values" do
				it { expect(mictorio.cabe_mijao?(10)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(-2)).to be_falsy }
			end
		end

		describe "#processa_arranjo!" do
			before { mictorio.processa_arranjo! }
			it { expect(mictorio.novo_arranjo).to eq [1,0,1,0] }
		end
	end

	context "when only the last position is availiable" do
		let(:mictorio) { Mictorio.new([1,0,1,0,0]) }
		
		describe "#cabe_mijao?" do
			context "when valid values" do
				it { expect(mictorio.cabe_mijao?(0)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(1)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(2)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(3)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(4)).to be_truthy }
			end
			context "when invalid values" do
				it { expect(mictorio.cabe_mijao?(9)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(-4)).to be_falsy }
			end
		end

		describe "#processa_arranjo!" do
			before { mictorio.processa_arranjo! }
			it { expect(mictorio.novo_arranjo).to eq [1,0,1,0,1] }
		end
	end


	context "when there is no position available" do
		let(:mictorio) { Mictorio.new([1,0,1,0,1]) }

		describe "#cabe_mijao?" do
			context "when valid values" do
				it { expect(mictorio.cabe_mijao?(0)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(1)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(2)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(3)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(4)).to be_falsy }
			end
			context "when invalid values" do
				it { expect(mictorio.cabe_mijao?(100)).to be_falsy }
				it { expect(mictorio.cabe_mijao?(-5)).to be_falsy }
			end
		end

		describe "#processa_arranjo!" do
			before { mictorio.processa_arranjo! }
			it { expect(mictorio.novo_arranjo).to eq [1,0,1,0,1] }
		end
	end
end
