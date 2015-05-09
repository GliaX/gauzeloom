class SolenoidMount < CrystalScad::Printed
	view :tunnel

	def initialize(args={})
		@pos = args[:pos] || 0
		@z = 6
		@color = "Indigo"
		@solenoid = Solenoid.new(pos:@pos).translate(z:@z)
		@distance_to_comb = 30		
		@x = @solenoid.x + @distance_to_comb
		@y = @solenoid.y
		@shuttle = Shuttle.new
		@shuttle_offset = 1.3
		@shuttle_margin = 2
		@tunnel_height = 50
		@tunnel_outside_margin = 8
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
		res -= @solenoid.frame_cut.translate(z:@z)
		
		res = colorize(res)		
		res += 	@solenoid if show
		res -= @solenoid.cut

		if !show
			res.rotate(y:90)		
		end
	
		res
	end

	def tunnel
		res = cylinder(d:@shuttle.diameter+@tunnel_outside_margin, h:@tunnel_height, fn:8)#.rotate(z:22.5)
		res += cube(@solenoid_center_z+@shuttle_offset,@shuttle.diameter+@tunnel_outside_margin,@tunnel_height).center_y

		res -= cylinder(d:@shuttle.diameter+@shuttle_margin,h:@tunnel_height+0.02, fn:8).translate(z:-0.01)	.rotate(z:22.5)	
	end

end
