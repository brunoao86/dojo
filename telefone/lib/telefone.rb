class Telefone

	DICIONARIO = {
		"A"  => 2,
		"B"  => 2,
		"C"  => 2,
		"D"  => 3,
		"E"  => 3,
		"F"  => 3,
		"G"  => 4,
		"H"  => 4,
		"I"  => 4,
		"J"  => 5,
		"K"  => 5,
		"L"  => 5,
		"M"  => 6,
		"N"  => 6,
		"O"  => 6,
		"P" => 7,
		"Q" => 7,
		"R" => 7,
		"S" => 7,
		"T"  => 8,
		"U"  => 8,
		"V"  => 8,
		"W" => 9,
		"X" => 9,
		"Y" => 9,
		"Z" => 9
	}

	def converter(expressao)
		expressao = expressao[0..29].upcase
		telefone = ""
		expressao.each_char do |char|
			numero = DICIONARIO[char]
			if numero.nil?
				telefone << char
			else
				telefone << numero.to_s
			end
		end
		return telefone
	end

end
