class Shuttle < CrystalScad::Printed
	def initialize(args={})
		@height = 85
		@diameter = 24
	end

	def part(show)
		res =	cylinder(d:@diameter,h:@height,fn:8)
		
		res *= hull(	
			cylinder(d1:56,d2:0,h:h2=25,fn:8).translate(z:@height-h2+4),
			cylinder(d1:0,d2:56,h:h2,fn:8).translate(z:-4)
		)

		res.rotate(z:22.5)
		# cutout for spool		
		res -= long_slot(d:20.8,h:58,l:10).translate(z:h2/2.0+1)
		
		# cutout for thread
		res -= long_slot(d:1.5,h:56,l:30).translate(x:-15,z:h2/2.0+2)

		# cutout for guide rod
		res -= long_slot(d:4.5,h:61.5,l:30).translate(z:h2/2.0-0.5)
	
		# rotate it for printing
		res.rotate(z:-90).rotate(x:-90)

		if !show
			# position part at z=0	
			res.translate(z:11)
			res +=guide_rod.rotate(z:-90).rotate(x:-90).translate(x:15)
		end

		res
	end

	def guide_rod
		res = cube([4,4,61]).center_xy
		res *= long_slot(d:4.5,h:61,l:1).translate(x:1)
		res.rotate(z:180).translate(x:2)
	end

end
