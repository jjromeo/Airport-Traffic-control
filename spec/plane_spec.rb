require 'plane'

describe Plane do 

	let(:plane) {Plane.new}
	let(:airport) {double :airport, launch!: nil, land!: nil, check_weather: nil}

	it 'Has flying status when created.' do
		expect(plane).to be_flying
	end

	it 'Can land and take off' do
		plane.land!
		expect(plane).not_to be_flying
		plane.take_off!
		expect(plane).to be_flying
	end


end