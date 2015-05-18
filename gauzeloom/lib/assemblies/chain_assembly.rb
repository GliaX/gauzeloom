class ChainAssembly < CrystalScad::Assembly
	skip :output

	def part(show)
		@chain = ChainElement.new
		res = @chain.show
		res += ChainElement.new.translate(x:@chain.hinge).show
		res += ChainElement.new(color:"pink").rotate(y:-50).translate(x:@chain.hinge*2).show
	end

end
