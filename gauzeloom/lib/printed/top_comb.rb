class TopComb < GuideComb

	def initialize()
		super
		@color = "Aqua"
	end

	def part(show)
		res = fins_and_side_walls			
		#res -= cube([@length+4,@total_width,3]).translate(x:-4,y:-@side_wall_length)

		@hardware << Bolt.new(5,30).rotate(y:90).translate(x:15,y:-@side_wall_length/2.0,z:@fin_height-10)
		@hardware << Bolt.new(5,30).rotate(y:90).translate(x:15,y:@width+@side_wall_length/2.0,z:@fin_height-10)

		# as this cube doesn't connect all the way down, add another cube that does
		res += cube([4,@total_width,3]).translate(x:-4,y:-@side_wall_length)

		# cut a bit of excess material on the top
		res -= cube([4,@total_width,@fin_height]).translate(x:@fin_position,y:-@side_wall_length,z:@height)

		# add a cube to each side where the bolts to through
		res += cube(10.5,@side_wall_length,z=20).translate(x:@fin_position,y:-@side_wall_length,z:@fin_height-z)		
		res += cube(10.5,@side_wall_length,z=20).translate(x:@fin_position,y:@width,z:@fin_height-z)		

		# remove a bit from the bottom
		res -= cube(@length+0.1,@total_width+0.2,3+0.1).translate(x:-4-0.1,y:-@side_wall_length-0.1,z:-0.1)
		

		res -= @hardware
		res = colorize(res)
		if !show
			res = res.rotate(y:-115).translate(z:4.9)
		end			

		res
	end

	def assembly_position
		self.rotate(x:90).rotate(y:-90).mirror(x:1).mirror(z:1).translate(y:-12.5,z:21+@length+55)
	end

	def fin(height=1)
		res = square([22,3])
		res += polygon(points:[[0,3],[@fin_position,0],[@fin_position,@fin_height]])			
		res -= circle(d:26,fn:8).rotate(z:22.5).translate(x:@fin_position+5,y:16)
		res.linear_extrude(h:height).rotate(x:90)
	end

end
