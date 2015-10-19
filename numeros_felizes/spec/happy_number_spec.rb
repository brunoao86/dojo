require 'happy_number'

describe HappyNumber do

  describe "#valid?" do

    context "valid numbers" do
      it { expect(HappyNumber.new(7)).to be_valid }
      it { expect(HappyNumber.new(-7)).to be_valid }
      it { expect(HappyNumber.new(123456789101112)).to be_valid }
    end

    context "invalid numbers" do
      it { expect(HappyNumber.new("7")).to_not be_valid }
      it { expect(HappyNumber.new(7.0)).to_not be_valid }
      it { expect(HappyNumber.new([7])).to_not be_valid }
      it { expect(HappyNumber.new({value: 7})).to_not be_valid }
    end
  end

  describe "#happy?" do

    context "happy numbers" do
      it { expect(HappyNumber.new(7)).to be_happy }
      it { expect(HappyNumber.new(-7)).to be_happy }
      it { expect(HappyNumber.new(280)).to be_happy }
      it { expect(HappyNumber.new(566)).to be_happy }
      it { expect(HappyNumber.new(847)).to be_happy }
      it { expect(HappyNumber.new(1000)).to be_happy }
    end

    context "sad numbers" do
      it { expect(HappyNumber.new(5)).to_not be_happy }
      it { expect(HappyNumber.new(-5)).to_not be_happy }
      it { expect(HappyNumber.new(292)).to_not be_happy }
      it { expect(HappyNumber.new(567)).to_not be_happy }
      it { expect(HappyNumber.new(850)).to_not be_happy }
      it { expect(HappyNumber.new(999)).to_not be_happy }
    end
  end

end
