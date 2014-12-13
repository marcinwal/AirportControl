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

end