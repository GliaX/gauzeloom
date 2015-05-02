class SideWall < CrystalScad::Printed
	
	def initialize(args={})
		@length = args[:length] || 30
		@height = args[:height] || 10
		@width = args[:width] || 101
	end

	def part(show)
		res = cube([@length,@width,@height]).translate(x:-@length)

		[0,15].each do |i|
			b = Bolt.new(3,25).rotate(x:-90).translate(x:-7.5-i,z:@height/2.0)
			res -= b.output
			res += b.show if show

			b = Bolt.new(3,25).rotate(x:90).translate(x:-7.5-i,y:@width,z:@height/2.0)
			res -= b.output
			res += b.show if show
		end


		res
	end

end
