class ChainAssembly < CrystalScad::Assembly
	skip :output

	def part(show)
		chain = Chain.new
		chain.add(ChainElement,5)
	#	chain.add(ChainElement,1,y:-40)
	#	chain.add(ChainElement,1,y:-40)
		
		return chain.show		
	end

end
