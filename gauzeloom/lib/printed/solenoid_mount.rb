class SolenoidMount < CrystalScad::Printed

	def initialize(args={})
		@pos = args[:pos] || 0
		@z = 4
		@color = "Indigo"
		@solenoid = Solenoid.new(pos:@pos).translate(z:@z)
		@distance_to_comb = 30		
		@x = @solenoid.x + @distance_to_comb
		@y = @solenoid.y
		@shuttle = Shuttle.new
		@shuttle_offset = 1.3
		@shuttle_margin = 1
		@tunnel_height = 50
		@tunnel_outside_margin = 6
		@solenoid_center_z = (@z+@solenoid.height/2.0)
	end

	def move_y
		self.translate(y:-@x+@x/2.0)
	end

	def center
		self.translate(x:-@x/2.0,y:-@y/2.0,z:-@solenoid_center_z-@shuttle_offset)	
	end
	
	def part(show)
		res= cube(@x,@y,@z)

		res += tunnel.rotate(y:90).translate(x:@x-@tunnel_height,y:@y/2.0,z:@solenoid_center_z+@shuttle_offset)
		
		res = colorize(res)		
		res += 	@solenoid if show
		res -= @solenoid.cut

	end

	def tunnel
		cylinder(d:@shuttle.diameter+@tunnel_outside_margin, id:@shuttle.diameter+@shuttle_margin, h:@tunnel_height, fn:8).rotate(z:22.5)
	end

end
