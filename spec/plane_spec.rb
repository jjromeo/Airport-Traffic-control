require 'plane'

describe Plane do 

	let(:plane) {Plane.new}

	it "Has flying status when created." do
		expect(plane).to be_flying
	end



end