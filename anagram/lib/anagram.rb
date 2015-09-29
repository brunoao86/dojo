class String

	def anagram
		length > 0 ? upcase.split(//).permutation.map { |a| a.join }.uniq : []
	end

end
