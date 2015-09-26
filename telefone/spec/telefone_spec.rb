require 'telefone'

describe Telefone do
	let(:telefone){ Telefone.new }
	
	describe "Conversão" do
		context "o valor convertido a partir das letras" do
			it { expect(telefone.converter("XNXN-CECE")).to eq "9696-2323" }
			it { expect(telefone.converter("1-HOME-SWEET-HOME")).to eq "1-4663-79338-4663" }
			it { expect(telefone.converter("MY-MISERABLE-JOB")).to eq "69-647372253-562" }
		end

		context "deve limitar em 30 caracteres" do
			it { expect(telefone.converter("1-HOME-SWEET-HOME-HELLO-WORLD-MY-FRIEND").length).to eq 30 }
		end

		context "case insensitive" do
			it { expect(telefone.converter("xnxn-CEce")).to eq telefone.converter("XNXN-CECE") }
			it { expect(telefone.converter("(0as) XNxn-CeCe")).to eq telefone.converter("(027) 9696-2323") }
		end

		context "caracteres fora do dicionario sao separadores" do
			it { expect(telefone.converter("+KL (0BR) XNXN-CECE")).to eq "+55 (027) 9696-2323" }
		end
	end
end
