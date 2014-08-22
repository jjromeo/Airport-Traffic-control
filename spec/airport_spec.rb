require 'airport'
describe Airport do 

	let(:airport) {Airport.new}
	let(:landing_plane) {double :flying_plane, :flying= => true}
	let(:plane) {double :plane, :flying= => true}

		it "should initialize with a default capacity" do 
			expect(airport.capacity).to eq(10)
		end

	context 'Taking off and landing:' do
		it "A plane can land." do
			expect(airport.planes).to eq []
			airport.land!(landing_plane)
			expect(airport.planes).to eq [landing_plane]
		end

		it "A plane can take off." do 
			airport.land!(plane)
			expect(airport.planes).to eq [plane]
			airport.launch!(plane)
			expect(airport.planes).to eq []
		end
	end

	context 'Traffic control:' do 
		it "A plane cannot land if the airport is full." do 
			10.times{airport.land!(plane)}
			expect(-> {airport.land!(plane)}).to raise_error "No more planes may land: the airport is full."
		end
	end
end

