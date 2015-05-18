class Chain < CrystalScad::Assembly
	# This lib will be moved to CrystalScad when finished

	def initialize(args={})
		@elements = args[:elements] || []		
		@rotations = args[:rotations] || []
		@positions = []
		super(args)
	end
	
	def add(element, quantity=1, rotation=nil)	
		offset = @elements.size		
		quantity.times do |i|
			i = i + offset
			e = element.send(:new)

			if i == 0
				x = -e.hinge[:x].to_f
				y = -e.hinge[:y].to_f 
				z = -e.hinge[:z].to_f
			else	
				x = @positions[i-1][:x]
				y = @positions[i-1][:y]
				z = @positions[i-1][:z]
			end
			if rotation
				r = rotation[:y]
			else
				r = 0
			end	

			x += e.hinge[:x].to_f 
			y += e.hinge[:y].to_f 
			z += 0 

			@elements << e
			@rotations << rotation
			
			@positions << {x:x,y:y,z:z}

		end
	end

	def position_element(index,element)
		if @rotations[index]
			element = element.rotate(@rotations[index])		
			puts @positions[index]
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
