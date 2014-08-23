class Airport

	DEFAULT_CAPACITY = 10

	attr_accessor :capacity

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	def planes
		@planes ||= []
	end

	def command_landing!(plane)
	raise "No more planes may land: the airport is full." if planes.count == capacity
	plane.land!
	planes << plane
	end

	def launch!(plane)
		plane.take_off!
		planes.delete(plane)
	end

	def check_weather
		# chance = rand(2)
		# if chance == 1
		# 	"stormy"
		# else 
		# 	"clear"
		%w(stormy, clear).sample
	end
end