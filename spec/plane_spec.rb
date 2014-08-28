require 'plane'

describe Plane do 

	let(:plane) {Plane.new}

	it 'Has flying status when created.' do
		expect(plane).to be_flying
	end

	it 'Can land' do
		plane.land!
		expect(plane).not_to be_flying
	end


	it "can take off" do 
		plane.take_off!
		expect(plane).to be_flying
	end

end