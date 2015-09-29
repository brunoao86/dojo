require 'anagram'

describe String do

	describe "#anagram" do
		
		context "When the string is empty" do
			describe "#length" do
				it { expect("".anagram.length).to eq 0 }
			end

			describe "the returned array" do
				it { expect("".anagram).to eq [] }
			end
		end

		context "When the string has one or more characters" do
			describe "#length" do
				it { expect("ab".anagram.length).to eq 2 }
				it { expect("air".anagram.length).to eq 6 }
				it { expect("bruno".anagram.length).to eq 120 }
			end

			describe "the returned array" do
				it { expect("a".anagram).to eq ["A"] }
				it { expect("ab".anagram).to eq ["AB", "BA"] }
			end
		end

		context "When the string has duplicated characters" do
			describe "#length" do
				it { expect("aa".anagram.length).to eq 1 }
				it { expect("aaaaaaaaa".anagram.length).to eq 1 }
				it { expect("ovo".anagram.length).to eq 3 }
			end

				describe "the returned array" do
					it { expect("aa".anagram).to eq ["AA"] }
					it { expect("aaaaaaa".anagram).to eq ["AAAAAAA"] }
					it { expect("ovo".anagram).to eq ["OVO", "OOV", "VOO"] }
				end
		end

	end

end
