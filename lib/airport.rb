class Airport

	def planes
		@planes ||= []
	end

	def land!(plane)
	plane.flying = false
	planes << plane
	end

	def launch!(plane)
		plane.flying = true
		planes.delete(plane)
	end
end