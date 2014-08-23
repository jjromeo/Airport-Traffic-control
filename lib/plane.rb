class Plane

attr_accessor :flying
attr_accessor :location

def initialize
	@flying = true
end

def flying?
	@flying
end

def take_off!
	@flying = true
end

def land!
	@flying = false
end

end