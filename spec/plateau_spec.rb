require File.expand_path('../../lib/mars', __FILE__)

describe Mars, "behaviour" do
  let (:input) { "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM" }

  before :each do
    @plateau = Mars.new input
  end

  it "initializes" do
    @plateau.should_not be_nil
  end

  it "sets up mars" do
    @plateau.height.should eq(5)
    @plateau.width.should eq(5)
  end

  it "creates rovers" do
    @plateau.rovers.count.should eq(2)
    @plateau.rovers[0].state.should eq(x: 1, y: 2, face: 'N')
    @plateau.rovers[1].state.should eq(x: 3, y: 3, face: 'E')
  end

  it "moves the rovers around" do
    @plateau.move_rovers
    @plateau.rovers[0].state.should eq(x: 1, y: 3, face: 'N')
    @plateau.rovers[1].state.should eq(x: 5, y: 1, face: 'E')
  end

  it "converts everything as displayable output" do
    @plateau.move_rovers
    @plateau.to_s.should eq("1 3 N\n5 1 E")
  end
end
