class Airport

	DEFAULT_CAPACITY = 10

	attr_accessor :capacity
	attr_writer :weather 

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	def planes
		@planes ||= []
	end

	def command_landing!(plane)
	raise "Planes cannot land during stormy weather" if weather == "stormy"
	raise "No more planes may land: the airport is full." if planes.count == capacity
	plane.land!
	planes << plane
	end

	def launch!(plane)
		raise "Planes cannot take off during stormy weather" if weather == "stormy"
		plane.take_off!
		planes.delete(plane)
	end

	def check_weather
		@chance_of_storm = rand(6)
		stormy_or_clear
	end

	def stormy_or_clear
		case @chance_of_storm
		when 1 then weather = "stormy"
		else weather = "clear"
		end
	end

	def weather
		@weather ||= "clear"
	end
end