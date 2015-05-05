class GauzeloomAssembly < CrystalScad::Assembly

	skip :output

	def part(show)
		res = Side.new.color("MediumAquamarine").show.rotate(y:-90).mirror(x:1).translate(x:-7.5)
		res += Side.new.color("MediumAquamarine").show.rotate(y:-90).translate(x:101+7.5)

		res += GuideComb.new.color("OldLace").output.rotate(x:90).rotate(y:-90).mirror(x:1).translate(y:-12.5,z:21.5)

		res += Shuttle.new.show.rotate(z:90).translate(x:90,y:-28,z:78.5)

	end

end
