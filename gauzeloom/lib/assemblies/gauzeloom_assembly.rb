class GauzeloomAssembly < CrystalScad::Assembly

	skip :output

	def initialize
		@side1 = Side.new.rotate(y:-90).mirror(x:1).translate(x:-7.5)
		@side2 = Side.new.rotate(y:-90).translate(x:101+7.5)
		@guidecomb_assembly = GuidecombAssembly.new.assembly_position
	end

	def part(show)
		res = @side1
		res += @side2 
		res += @guidecomb_assembly
		
	end

end
