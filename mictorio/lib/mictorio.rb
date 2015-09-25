class Mictorio
	attr_reader :arranjo, :lugares, :posicoes, :novo_arranjo

	def initialize(arranjo)
		@arranjo = arranjo
		@novo_arranjo = arranjo.dup
		@posicoes = []
	end

	def lugares
		@posicoes.length
	end

	def cabe_mijao? index
		return !(@novo_arranjo[index] == 1 || @novo_arranjo[(index-1).abs]==1 || @novo_arranjo[index+1]==1 || index >= @novo_arranjo.length || index < 0)
	end

	def processa_arranjo!
		@arranjo.each_with_index { |ocupado, index| insere_mijao!(index) if cabe_mijao?(index) }
	end

	private
	def insere_mijao! index
		@novo_arranjo[index] = 1
		@posicoes << index
	end
end

