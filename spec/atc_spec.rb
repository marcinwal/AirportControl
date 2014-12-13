require 'atc'
require 'plane'
require 'airport'

describe ATC do
  
  let(:luton){Airport.new(airport_id: 1,capacity: 5)}
  let(:stanstead){Airport.new(airport_id: 2,capacity: 5)}

  let(:planes1){5.times.map{Plane.new(airport_id: 1)}}
  let(:planes2){5.times.map{Plane.new(airport_id: 2)}}

  let(:atc){ATC.new(gridx: 10, gridy: 10)}

  it 'should have no planes initially' do
    expect(atc.planes_n).to eq(0)
  end

  it 'should have no airports initially' do 
    expect(atc.airports_n).to eq(0)
  end

  it 'should add planes to the space' do
    planes1.each {|pl| atc.add_plane(pl)}
    expect(atc.planes_n).to eq(5)
  end

  it 'should add airport to the space' do
    atc.add_airport(airport: luton, x: 3, y: 3)
    expect(atc.airports_n).to eq(1)
  end

  it 'should match exactly the airport' do
    atc.add_airport(airport: luton, x: 3, y: 3)
    expect(atc.airport_match(1,3,3)).to eq(luton)
  end

end