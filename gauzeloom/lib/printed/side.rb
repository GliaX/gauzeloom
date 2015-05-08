class Side < CrystalScad::Printed
	def initialize(args={})
		@height = 7.5
		@length = 110
		@width = 25
		
		@side_mounting_plate_length = 47
		@side_mounting_plate_width = 45

		@side_mouting_bolts_offset_from_center = 35.0/2.0
		@side_mouting_bolts_offset_from_bottom = 29
		@side_mouting_bolts_distance = 15

		@bottom_mounting_plate_width = 75
		@bottom_mounting_plate_length = 3

		@big_slot_offset_from_center = 7.5
		@big_slot_offset_from_bottom = 15.5
		@hardware = []
	end

	def part(show)
		res = basic_shape

		# I'm skipping the side mouting holes which was on the original model because they were not used

		res -= nylon_channel.rotate(x:-90).translate(x:105,y:0,z:@height)
		
		# thread fixation point
		res -= fixation_point.translate(x:6,y:7,z:-0.1)

		[-1,1].each do |i|
			# Big slot cutout
			res -= cube([106,5,@height]).center_y.translate(x:@big_slot_offset_from_bottom,y:@big_slot_offset_from_center*i, z:3)
			
			# Inner slot cutout
			res -= cube([85,3.5,@height]).center_y.translate(x:@big_slot_offset_from_bottom+2,y:@big_slot_offset_from_center*i, z:-0.1)


			res = colorize(res)			

			# Bottom mounting holes

			b = Bolt.new(3,16,washer:true).rotate(y:-90).translate(x:@bottom_mounting_plate_length,y:32*i,z:@height/2.0)	
			@hardware << b				
			res -= b.output
		
			# Side mounting bolts
			[0,@side_mouting_bolts_distance].each do |j|
				b = Bolt.new(4,10).mirror(z:1).translate(x:@side_mouting_bolts_offset_from_bottom+j,y:@side_mouting_bolts_offset_from_center*i,z:@height)	
				@hardware << b				
				res -= b.output
			end		
		end
		
		res
	end

	def basic_shape
		res = cube([@length,@width,@height]).center_y
		res += cube([@side_mounting_plate_length,@side_mounting_plate_width,@height]).center_y
		res += cube([@bottom_mounting_plate_length,@bottom_mounting_plate_width,@height]).center_y
		res
	end

	def nylon_channel
		h = 10	
		h2 = 30
		res = cylinder(d:2,h:h)
		res += cylinder(d:2,h:h2).translate(z:-@big_slot_offset_from_center*2).rotate(x:65)
		res += cylinder(d:2,h:h2).translate(z:-@big_slot_offset_from_center*2).rotate(x:-65).translate(z:h)
		res.translate(z:-h/2.0)	
	end

	def fixation_point
		res = cube([1.2,20,@height+0.2])
		res += cube([4.2,1.2,@height+0.2])
		res += cube([1.2,8,@height+0.2]).translate(x:4.2,y:-3.7)

	end

end	

