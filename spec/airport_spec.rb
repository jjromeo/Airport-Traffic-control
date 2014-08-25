require 'airport'
describe Airport do 

	let(:airport) {Airport.new}
	let(:landing_plane) {double :flying_plane, :flying= => true, land!: nil}
	let(:plane) {double :plane, :flying= => true, land!: nil, take_off!: nil}
	let(:chance) {double :chance, rand(2)}
		
		it "should initialize with a default capacity" do 
			expect(airport.capacity).to eq(1)
		end

	context 'Taking off and landing:' do
		it "A plane can land." do
			expect(airport.planes).to eq []
			airport.command_landing!(landing_plane)
			expect(airport.planes).to eq [landing_plane]
		end

		it "A plane can take off." do 
			airport.command_landing!(plane)
			expect(airport.planes).to eq [plane]
			airport.launch!(plane)
			expect(airport.planes).to eq []
		end
	end

	context 'Traffic control:' do 
		it "A plane cannot land if the airport is full." do 
			airport.capacity.times{airport.command_landing!(plane)}
			expect(-> {airport.command_landing!(plane)}).to raise_error "No more planes may land: the airport is full."
		end

		context 'Weather conditions:' do 
			it "Can check whether the weather is stormy or clear" do 
				expect(%w(stormy clear)).to include airport.check_weather
			end

			context 'Stormy weather:' do
				before(:each) do 
					airport.weather = "stormy"
				end

				it "A plane cannot take off when the weather is stormy" do
					expect{airport.launch!(plane)}.to raise_error "Planes cannot take off during stormy weather"
				end

				it "A plane cannot land when the weather is stormy" do 
					expect{airport.command_landing!(plane)}.to raise_error "Planes cannot land during stormy weather"
				end

			end


		end

	end


end


