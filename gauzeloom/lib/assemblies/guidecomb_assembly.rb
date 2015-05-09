class GuidecombAssembly < CrystalScad::Assembly

	skip :output

	def initialize
		@guidecomb = GuideComb.new
		@topcomb = TopComb.new.assembly_position
		shuttle_end_pos = -90
		@shuttle = Shuttle.new.translate(@guidecomb.comb_center).translate(y:shuttle_end_pos)

		@solenoid_mount1 = SolenoidMount.new(pos:18).translate(@guidecomb.comb_center).translate(y:-@guidecomb.side_wall_length)
	end

	def assembly_position
		self.rotate(x:90).rotate(y:-90).mirror(x:1).translate(y:-12.5,z:21.5+@guidecomb.length)
	end

	def part(show)
			
		res = @guidecomb.show
		res += @guidecomb.show_hardware

		res += @topcomb.show

		res += @shuttle.show
		res += @solenoid_mount1.show

	end

end
