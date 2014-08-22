class Airport

	DEFAULT_CAPACITY = 10

	attr_accessor :capacity

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	def planes
		@planes ||= []
	end

	def land!(plane)
	raise "No more planes may land: the airport is full." if planes.count == capacity
	plane.flying = false
	planes << plane
	end

	def launch!(plane)
		plane.flying = true
		planes.delete(plane)
	end
end