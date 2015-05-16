class Chain < CrystalScad::Assembly
	
	def initialize(args={})
		@x = 30
		@y = 14
		@height = 6
		@cut_x = 7
		@cut_y = 5
		@margin = 1
		@hardware = []	
	end

	def part(show)
		res = square(@x,@y).center_y
		res += square(@cut_x,@cut_y).center_y.translate(x:@x)
		res -= square(@cut_x,@cut_y+@margin).center_y
		res = res.linear_extrude(h:@height)

		@hardware << Bolt.new(3,16).rotate(x:90).translate(x:@cut_x/2.0,y:@y/2.0,z:@height/2.0)
		@hardware << Nut.new(3).rotate(z:30).rotate(x:90).translate(x:@cut_x/2.0,y:-@y/2.0+1.5,z:@height/2.0)
	
		@hardware << Bolt.new(3,16).rotate(x:90).translate(x:@x+ @cut_x/2.0,y:@y/2.0,z:@height/2.0)
	
	
		res -= @hardware
		res += @hardware if show
		
	end	

end
