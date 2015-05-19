class ChainAssembly < CrystalScad::Assembly
	skip :output

	def part(show)
		chain = Chain.new
		chain.add(ChainElement,3)
		chain.add(ChainElement,2,y:-40)

		chain.add(ChainElement,2,y:-90)
		chain.add(ChainElement,1,y:-120)
		chain.add(ChainElement,3,y:-180)
		
		return chain.show		
	end

end
