class Plane

attr_accessor :flying

def initialize
	@flying = true
end

def flying?
	@flying
end

def take_off!
	@flying = true
end



end