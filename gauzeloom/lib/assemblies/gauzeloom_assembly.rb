class GauzeloomAssembly < CrystalScad::Assembly

	def part(show)
		res = Side.new.show.rotate(y:-90).mirror(x:1).translate(x:-7.5)
		res += Side.new.show.rotate(y:-90).translate(x:101+7.5)

		res += GuideComb.new.output.rotate(x:90).rotate(y:-90).mirror(x:1).translate(y:-12.5,z:21.5)

	end

end
