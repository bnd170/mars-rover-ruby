require File.join(File.dirname(__FILE__), '../src/mars_rover')

describe MarsRover do

  describe "#mars_rover" do
    it "the rover knows its landing zone" do
      rover = MarsRover.land(5, 5, 'N', World.new(5, 5))

      check_rover_coords(rover, [5, 5, 'N'])
    end

    it "the rover can move one coord to north" do
      rover = MarsRover.land(5, 5, 'N', World.new(5, 5))
      rover.move('M')

      check_rover_coords(rover, [5, 0, 'N'])
    end

    it "the rover can move one coord to south" do
      rover = MarsRover.land(5, 5, 'S', World.new(5, 5))
      rover.move('M')

      check_rover_coords(rover, [5, 4, 'S'])
    end

    it "the rover can move one coord to east" do
      rover = MarsRover.land(5, 5, 'E', World.new(5, 5))
      rover.move('M')

      check_rover_coords(rover, [0, 5, 'E'])
    end

    it "the rover can move one coord to west" do
      rover = MarsRover.land(5, 5, 'W', World.new(5, 5))
      rover.move('M')

      check_rover_coords(rover, [4, 5, 'W'])
    end

    it "the rover can turn left from north" do
      rover = MarsRover.land(5, 5, 'N', World.new(5, 5))
      rover.move('L')

      check_rover_coords(rover, [5, 5, 'W'])
    end

    it "the rover can turn left from east" do
      rover = MarsRover.land(5, 5, 'W', World.new(5, 5))
      rover.move('L')

      check_rover_coords(rover, [5, 5, 'S'])
    end

    it "the rover can turn left from south" do
      rover = MarsRover.land(5, 5, 'S', World.new(5, 5))
      rover.move('L')

      check_rover_coords(rover, [5, 5, 'E'])
    end

    it "the rover can turn left from east" do
      rover = MarsRover.land(5, 5, 'E', World.new(5, 5))
      rover.move('L')

      check_rover_coords(rover, [5, 5, 'N'])
    end

    it "the rover can turn right from north" do
      rover = MarsRover.land(5, 5, 'N', World.new(5, 5))
      rover.move('R')

      check_rover_coords(rover, [5, 5, 'E'])
    end

    it "the rover can turn right from east" do
      rover = MarsRover.land(5, 5, 'W', World.new(5, 5))
      rover.move('R')

      check_rover_coords(rover, [5, 5, 'N'])
    end

    it "the rover can turn right from south" do
      rover = MarsRover.land(5, 5, 'S', World.new(5, 5))
      rover.move('R')

      check_rover_coords(rover, [5, 5, 'W'])
    end

    it "the rover can turn right from east" do
      rover = MarsRover.land(5, 5, 'E', World.new(5, 5))
      rover.move('R')

      check_rover_coords(rover, [5, 5, 'S'])
    end

    it "the rover can move free" do
      rover = MarsRover.land(0, 0, 'N', World.new(5, 5))
      rover.move('MMRMMMMRRRMMLMM')

      check_rover_coords(rover, [2, 4, 'W'])
    end

    def check_rover_coords(rover, cords)
      expect(rover.landing_zone).to eq cords
    end

  end

end