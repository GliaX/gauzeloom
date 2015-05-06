class GauzeloomAssembly < CrystalScad::Assembly

	skip :output

	def part(show)
		res = Side.new.color("MediumAquamarine").show.rotate(y:-90).mirror(x:1).translate(x:-7.5)
		res += Side.new.color("MediumAquamarine").show.rotate(y:-90).translate(x:101+7.5)

		guidecomb = GuideComb.new.assembly_position
		res += guidecomb.show
		res += guidecomb.show_hardware

		topcomb = TopComb.new.assembly_position
		res += topcomb.show

		res += Shuttle.new.show.rotate(z:90).translate(x:90,y:-28,z:78.5)

	end

end
