require File.expand_path('../../lib/mars', __FILE__)
require File.expand_path('../../lib/rover', __FILE__)

describe Rover, "behaviour" do
  let (:input) { ['1', '2', 'N', 'LMLMLMLMM'] }

  before :each do
    @plateau = Mars.new "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM"
    @rover = Rover.new input, @plateau
  end

  it "turns left when get L" do
    @rover.act 'L'
    @rover.state[:face].should eq('W')
  end

  it "turns right when get R" do
    @rover.act 'R'
    @rover.state[:face].should eq('E')
  end

  it "moves forward when get M" do
    @rover.act 'M'
    @rover.state[:x].should eq(1)
    @rover.state[:y].should eq(3)

    @rover.act 'R'
    @rover.act 'M'
    @rover.state[:x].should eq(2)
    @rover.state[:y].should eq(3)

    @rover.act 'R'
    @rover.act 'M'
    @rover.state[:x].should eq(2)
    @rover.state[:y].should eq(2)

    @rover.act 'R'
    @rover.act 'M'
    @rover.state[:x].should eq(1)
    @rover.state[:y].should eq(2)
  end

  it "moves around" do
    @rover.move
    @rover.state.should eq(x: 1, y: 3, face: 'N')
  end

  it "converts to string" do
    @rover.move
    @rover.to_s.should eq('1 3 N')
  end

  it "does not let the rover go out of mars" do
    5.times { @rover.act 'M' }
    @rover.act 'R'
    5.times { @rover.act 'M' }

    @rover.state.should eq(x: 5, y: 5, face: 'E')

    @rover.act 'R'
    8.times { @rover.act 'M' }
    @rover.act 'R'
    8.times { @rover.act 'M' }

    @rover.state.should eq(x: 0, y: 0, face: 'W')
  end
end
