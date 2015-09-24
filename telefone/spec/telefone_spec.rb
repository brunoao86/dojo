require 'telefone'

describe Telefone do
	let(:telefone){ Telefone.new }
	
	describe "Conversão" do
		context "o valor convertido a partir das letras" do
			it { expect(telefone.converter("XYXN-0PEN")).to eq "9996-0736" }
			it { expect(telefone.converter("1-HOME-SWEET-HOME")).to eq "1-4663-79338-4663" }
			it { expect(telefone.converter("MY-MISERABLE-JOB")).to eq "69-647372253-562" }
		end

		context "deve limitar em 30 caracteres" do
			it { expect(telefone.converter("1-HOME-SWEET-HOME-HELLO-WORLD-MY-FRIEND").length).to eq 30 }
		end

		context "case insensitive" do
			it { expect(telefone.converter("xyxn-0pen")).to eq telefone.converter("XYXN-0PEN") }
			it { expect(telefone.converter("(0AS) xyxn-0pen")).to eq telefone.converter("(027) 9996-0736") }
		end
	end
end
