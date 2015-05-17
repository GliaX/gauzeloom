class ChainAssembly < CrystalScad::Assembly
	skip :output

	def part(show)
		@chain = Chain.new
		res = @chain.show
		res += Chain.new.translate(x:@chain.hinge).show
		res += Chain.new(color:"pink").rotate(y:-50).translate(x:@chain.hinge*2).show
	end

end
