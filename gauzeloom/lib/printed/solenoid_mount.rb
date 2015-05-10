class SolenoidMount < CrystalScad::Printed
	view :tunnel

	def initialize(args={})
		@pos = args[:pos] || 0
		@z = 6
		@color = "Indigo"
		@solenoid = Solenoid.new(pos:@pos).translate(z:@z)
		@guidecomb = GuideComb.new	
		@guidecomb.show

		@distance_to_comb = 30		
		@x = @solenoid.x + @distance_to_comb
		@y = @solenoid.y
		@shuttle = Shuttle.new
		@shuttle_offset = 1.3
		@shuttle_margin = 2
		@tunnel_height = 50
		@tunnel_outside_margin = 8
		@solenoid_center_z = (@z+@solenoid.height/2.0)
		@hardware = []
		@bolt_mount_height	 = 8
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
		# rotate and center to shuttle = 0
		res = res.rotate(x:90).rotate(z:90).translate(x:-@solenoid_center_z-@shuttle_offset,y:-@x,z:-@y/2.0)
	
		@guidecomb.side_mount_nuts.each do |nut|
			@hardware << nut.bolt(16).translate(y:@guidecomb.side_wall_length).translate(@guidecomb.comb_center(-1))
		end

		# Mounts for the bolts
		bolt1, bolt2 = @hardware		
		bolt_mounts = long_slot(d:14,h:@bolt_mount_height,l:3).transform(bolt1)
		bolt_mounts += long_slot(d:14,h:@bolt_mount_height,l:5).rotate(z:90).transform(bolt2)

		res += colorize(bolt_mounts)

		# since bolt1 makes the bolt collide with the flat surface, cut it
		res -= cylinder(d:8,h:@tunnel_height-@bolt_mount_height).translate(z:-@tunnel_height+@bolt_mount_height).transform(bolt1)



		res -= @hardware
		res += @hardware if show
	
		if !show
			res.rotate(x:-90)		
		end
	
		res
	end

	def tunnel
		res = cylinder(d:@shuttle.diameter+@tunnel_outside_margin, h:@tunnel_height, fn:8)#.rotate(z:22.5)
		res += cube(@solenoid_center_z+@shuttle_offset,@shuttle.diameter+@tunnel_outside_margin,@tunnel_height).center_y

		res -= cylinder(d:@shuttle.diameter+@shuttle_margin,h:@tunnel_height+0.02, fn:8).translate(z:-0.01)	.rotate(z:22.5)	
	end

end
