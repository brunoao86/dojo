class Mictorio
	attr_reader :arranjo

	def initialize(arranjo)
		@arranjo = arranjo
	end

	def lugares_disponiveis
		posicoes = []
		novo_arranjo = @arranjo.dup 
		@arranjo.each_with_index do |ocupado, index|
			cabe_mijao = (ocupado==1 || novo_arranjo[index-1]==1 || novo_arranjo[index+1]==1) ? false : true
			if cabe_mijao
				novo_arranjo[index] = 1
				posicoes << index
			end
		end
		
		return [@arranjo, posicoes.length, posicoes]
	end

end

