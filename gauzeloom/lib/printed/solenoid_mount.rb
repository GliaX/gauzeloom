class SolenoidMount < CrystalScad::Printed

	def initialize(args={})
		@pos = args[:pos] || 0
		@z = 4
		@color = "Indigo"
		@solenoid = Solenoid.new(pos:@pos).translate(z:@z)
		@x = @solenoid.x
		@y = @solenoid.y
		@shuttle_offset = 1.3

	end

	def center
		self.translate(x:-@x/2.0,y:-@y/2.0,z:-(@z+@solenoid.height/2.0)-@shuttle_offset)	
	end
	
	def part(show)
		res= cube(@x,@y,@z)
		res = colorize(res)		
		res += 	@solenoid if show
		res -= @solenoid.cut

	end

end
