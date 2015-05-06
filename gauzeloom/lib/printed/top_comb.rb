class TopComb < GuideComb

	def initialize()
		super
		@color = "WhiteSmoke"
		@disable_side_wall = true
	end

	def assembly_position
		self.rotate(x:90).rotate(y:-90).mirror(x:1).mirror(z:1).translate(y:-12.5,z:21.5+@length+55)
	end

	def fin(height=1)
		res = square([22,3])
		res += polygon(points:[[0,3],[@fin_position,0],[@fin_position,@fin_height]])			
		res -= circle(d:26,fn:8).rotate(z:22.5).translate(x:@fin_position+5,y:16)
		res.linear_extrude(h:height).rotate(x:90)
	end

end
