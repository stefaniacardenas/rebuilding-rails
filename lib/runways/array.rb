class Array

	def sum(start = 0)
		# & means pass as a block
		# :+ means the simbol +
		# We are passing a symbol as if it was a block. 
		# Ruby will convert the symbol into a proc that calls it
		# Basically we are saying "Add these together"
		inject(start, &:+)
	end

end