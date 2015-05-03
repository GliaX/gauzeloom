class GuideComb < CrystalScad::Printed
	def initialize()
		@length = 30
		@width = 101
		@height = 10

		@fin_height = 50
		@fin_position = 22
	end

	def part(show)
		# sidewall
		res = SideWall.new(length:@length,height:@height,width:@width).part(show)
			
		# Add a cube to act as "bottom", connecting fins and sidewall
		res += cube([4,@width,@fin_height+4]).rotate(y:25).translate(x:-4,z:3)

		# fins
		(0..40).each do |i|
			res += fin.translate(y:i*2.5+1)	
		end
		

		# cut a bit of excess material on the top
		res -= cube([4,@width,@fin_height]).translate(x:@fin_position,z:@height)

		res.translate(x:@length)
		colorize(res)
	end

	def fin
		res = square([60,3])
		res += polygon(points:[[0,3],[@fin_position,0],[@fin_position,@fin_height]])			
		res -= circle(d:26,fn:8).rotate(z:22.5).translate(x:@fin_position+5,y:16)
		res.linear_extrude(h:1).rotate(x:90)
	end

end	

