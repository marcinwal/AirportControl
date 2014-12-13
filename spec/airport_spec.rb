require 'airport'
require 'plane'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) { Airport.new(airport_id: 1, capacity: 5) }

  context 'taking off and landing' do

    let(:plane) {double :flying_plane}
    let(:plane_gr) {double :landed_plane, flying?: false}

    it 'a plane can land' do
      allow(plane).to receive(:land).and_return plane
      allow(airport).to receive(:weather).and_return 'sunny'
      airport.accept(plane)
      expect(airport.count).to eq(1)
    end

    it 'a plane can take off' do
      allow(airport).to receive(:weather).and_return 'sunny'
      allow(plane_gr).to receive(:take_off)
      airport.allow(plane_gr,1)
    end
  end

  context 'traffic control' do




    it 'a plane cannot land if the airport is full' do
      #expect(airport.accept(plane)).to raise_error(RuntimeError, 'Airport is full')
    end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do

      end

      it 'a plane cannot land in the middle of a storm' do

      end
    end
  end
end

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

describe Plane do

  let(:plane) { Plane.new(airport_id: 1) }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when in the air' do
    plane.take_off(airport_id: 1)
    expect(plane).to be_flying
  end

  it 'can take off' do
    expect(plane).to receive(:take_off).with(airport_id: 1)
    plane.take_off(airport_id: 1)
  end

  it 'can land and change the status to not flying' do
    plane.land
    expect(plane).not_to be_flying
  end

  it 'changes its status to flying after taking off' do
    plane.land
    status = plane.flying?
    plane.take_off(airport_id: 1)
    expect(plane.flying).to eq(!status) #change of the status
                                        #after a take off
  end
end

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The gand finale (last spec)" do

  it 'all planes can land and all planes can take off' do

  end
end

