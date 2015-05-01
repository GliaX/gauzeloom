class Comb < CrystalScad::Printed
	def initialize()
		@height = 5
	end

	def part(show)
		res = cube([52,110,@height]).center_xy
		res -= cube([52,102,@height+0.2]).center_xy.translate(x:-10,z:-0.1)

		# mounting holes
		[-20,20].each do |i|
			[-53,53].each do |j|
				res -= cylinder(d:3.4,h:30,fn:8).rotate(z:45/2.0).rotate(x:90).translate(x:i,y:j+15,z:@height/2.0)
			end		
		end
		
		# fins
		(0..19).each do |i|
			res += fin.translate(y:20*2.5-i*5-1.8)	
		end
		

		res
	end

	def fin
		res = cube([53,2.9,@height]).center_xy.translate(x:-1)
		res -= cylinder(d:2,h:@height+0.2).translate(z:-0.1).scale(x:4,y:0.55).translate(x:-20.44)
		# thread insert hole
		res -= cube([0.8,1.6,@height+0.2]).center_xy.translate(x:-20.6,y:1,z:-0.1)
	end

end	

