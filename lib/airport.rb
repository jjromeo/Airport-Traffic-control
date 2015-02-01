class Airport
  DEFAULT_CAPACITY = 6

  attr_accessor :capacity

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def planes
    @planes ||= []
  end

  def command_landing(plane)
    fail 'No more planes may land: the airport is full.' if planes.count == capacity
    fail 'Planes cannot land during stormy weather' if weather == 'stormy'
    plane.land
    planes << plane
    check_weather
  end

  def launch(plane)
    fail 'Planes cannot take off during stormy weather' if weather == 'stormy'
    plane.take_off
    planes.delete(plane)
    check_weather
  end

  def check_weather
    rand(6) == 1 ? 'stormy' : 'clear'
  end

  def weather
    check_weather
  end
end
