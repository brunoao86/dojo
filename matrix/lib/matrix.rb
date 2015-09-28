class Matrix

	attr_accessor :matrix, :max

	def initialize(matrix)
		@matrix = matrix
	end

	def product_line index
		@matrix[index].inject(:*)
	end

	def product_column index
		(0...@matrix.length).inject(1) { |prod, j| prod *= @matrix[j][index] }
	end

	def max
		return @max unless @max.nil?

		lines = []
		columns = []
		diagonal1 = 1
		diagonal2 = 1
		k = @matrix.length-1

		(0...@matrix.length).each do |index|
			lines << product_line(index)
			columns << product_column(index)
			diagonal1 *= @matrix[index][index]
			diagonal2 *= @matrix[index][k]
			k -= 1
		end

		@max = [lines, columns, diagonal1, diagonal2].flatten.max
	end

end
