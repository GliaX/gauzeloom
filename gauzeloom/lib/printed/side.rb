class Side < CrystalScad::Printed
	def initialize()
		@height = 7.5
		@length = 110
		@width = 25
		
		@side_mounting_plate_length = 50
		@side_mounting_plate_width = 45

		@side_mouting_bolts_offset_from_center = 35.0/2.0
		@side_mouting_bolts_offset_from_bottom = 29
		@side_mouting_bolts_distance = 15

		@bottom_mounting_plate_width = 75
		@bottom_mounting_plate_length = 3

		@big_slot_offset_from_center = 7.5
		@big_slot_offset_from_bottom = 15.5
	end

	def part(show)
		res = basic_shape

		# I'm skipping the side mouting holes which was on the original model because they were not used

		[-1,1].each do |i|
			# Bottom mounting holes

			b = Bolt.new(3,16,washer:true).rotate(y:-90).translate(x:@bottom_mounting_plate_length,y:32*i,z:@height/2.0)	
			res += b.show if show
			res -= b.output
		
			# Side mounting bolts
			[0,@side_mouting_bolts_distance].each do |j|
				b = Bolt.new(4,10).mirror(z:1).translate(x:@side_mouting_bolts_offset_from_bottom+j,y:@side_mouting_bolts_offset_from_center*i,z:@height)	
				res += b.show if show
				res -= b.output
			end

			# Big slot cutout
			res -= cube([106,5,@height]).center_y.translate(x:@big_slot_offset_from_bottom,y:@big_slot_offset_from_center*i, z:3)
			
			# Inner slot cutout
			res -= cube([85,3.5,@height]).center_y.translate(x:@big_slot_offset_from_bottom+2,y:@big_slot_offset_from_center*i, z:-0.1)
		
		end

		res -= nylon_channel.rotate(x:-90).translate(x:105,y:0,z:@height)
		
		# thread fixation point
		res -= fixation_point.translate(x:6,y:7,z:-0.1)
		
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

=begin

difference(){
union(){
translate([-14,55,7.5])cube([110,7,25],true);
translate([16,55,7.5])cube([50,7,45],true);
translate([40,55,7.5])cube([3,7,75],true);

}
translate([20,55,-20])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([5,55,-20])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([20,55,35])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([5,55,35])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([35,55,-25])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=1.75,h=30,$fn=8,center=true);
translate([35,55,40])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=1.75,h=30,$fn=8,center=true);
translate([12.5,55,-10])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([-2.5,55,-10])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([12.5,55,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([-2.5,55,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([-27,53.1,0])cube([106,5,6],true);
translate([-27,53.1,15])cube([106,5,6],true);
translate([-20,56.1,0])cube([85,5,3.5],true);
translate([-20,56.1,15])cube([85,5,3.5],true);
translate([-66,58.1,15]){rotate([-65,0,0])rotate([0,0,45/2])cylinder(r=1,h=30,$fn=8,center=true);
translate([0,0,-15])rotate([65,0,0])rotate([0,0,45/2])cylinder(r=1,h=30,$fn=8,center=true);
translate([0,-7,-10])rotate([0,0,0])rotate([0,0,45/2])cylinder(r=1,h=15,$fn=8,center=true);
translate([0,-3,-19])rotate([-25,0,0])cube([1.2,15,10],true);
translate([0,-3,4])rotate([25,0,0])cube([1.2,15,10],true);
}

translate([28,58.1,15]){rotate([-65,0,0])rotate([0,0,45/2])cylinder(r=1,h=30,$fn=8,center=true);
translate([6,-1,-24.5])cube([1.2,15,20],true);
translate([2,-1,-15])cube([1.2,15,8],true);
translate([4,-1,-15])cube([4.2,15,1.2],true);
translate([0,-13,10])rotate([25,0,0])cube([1.2,35,30
],true);
}
}
=end
