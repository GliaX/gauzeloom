class Chain < CrystalScad::Assembly
	# This lib will be moved to CrystalScad when finished

	def initialize(args={})
		@elements = args[:elements] || []		
		@rotations = args[:rotations] || []
		@positions = []
		@x = 0
		@y = 0 
		@z = 0

	end
	
	def add(element, quantity=1, rotation=nil)	

		offset = @elements.size		
		quantity.times do |i|
			i = i + offset
			e = element.send(:new)

			@elements << e
			
			@positions << {x:@x,y:@y,z:@z}
			@rotations << rotation
			if rotation
				if rotation[:x]
					raise("rotation in x is not implemented in Chain, use y direction")
				elsif rotation[:y]
					r = rotation[:y]
					@x += sin(radians(90-r)) * e.hinge[:x].to_f
					@y += e.hinge[:y].to_f 
					@z += sin(radians(r*-1)) * e.hinge[:x].to_f
				elsif rotation[:z]
					raise("rotation in x is not implemented in Chain, use y direction")
				end
			else
				@x += e.hinge[:x].to_f
				@y += e.hinge[:y].to_f 
				@z += e.hinge[:z].to_f
			end	



		end
	end

	def position_element(index,element)
		if @rotations[index]
			element = element.rotate(@rotations[index])		
		end

		return element.translate(@positions[index])
	end
	
	def part(show)
		res = nil
		@elements.each_with_index do |e,i|
			res += position_element(i,e).part(show)
		end
		res
	end

end
