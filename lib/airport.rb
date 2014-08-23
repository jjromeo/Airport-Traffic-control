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
		chance = rand(6)
		case chance
		when 1 
			weather = "stormy"
		else
			weather = "clear"
		end
		# weather = %w(stormy clear).sample
	end

	def weather
		@weather ||= "clear"
	end
end