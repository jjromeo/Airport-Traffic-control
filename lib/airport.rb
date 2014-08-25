class Airport

	DEFAULT_CAPACITY = 1

	attr_accessor :capacity
	attr_writer :weather 

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	def planes
		@planes ||= []
	end

	def command_landing!(plane)
	raise "No more planes may land: the airport is full." if planes.count == capacity
	raise "Planes cannot land during stormy weather" if weather == "stormy"
	plane.land!
	planes << plane
	check_weather
	end

	def launch!(plane)
		raise "Planes cannot take off during stormy weather" if weather == "stormy"
		plane.take_off!
		planes.delete(plane)
		check_weather
	end

	def check_weather
		@chance = rand(6)
		case @chance
		when 1 
			@weather = "stormy"
		else
			@weather = "clear"
		end
	end

	def weather
		@weather ||= "clear"
	end
end