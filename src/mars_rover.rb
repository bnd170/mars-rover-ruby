# frozen_string_literal: true

class MarsRover

  attr_writer :world
  attr_reader :landing_zone

  class << self
    def land(x, y, direction, world)
      new(x, y, direction, world)
    end
  end

  def initialize(x, y, direction, world)
    @landing_zone = [x, y, direction]
    @world = world
  end

  def move(command)
    command.split('').each { |split_command|
      move_coord(split_command)
    }
  end

  private

  def move_coord(command)
    command_rules = rule_set(command)

    if command == 'M'
      @landing_zone[0] += command_rules[@landing_zone[2]][0]
      @landing_zone[1] += command_rules[@landing_zone[2]][1]

      keep_into_planet
    else
      @landing_zone[2] = command_rules[@landing_zone[2]]
    end

  end

  def rule_set(command)
    rules = {
      'L' => {
        'N' => 'W',
        'W' => 'S',
        'S' => 'E',
        'E' => 'N'
      },
      'R' => {
        'N' => 'E',
        'E' => 'S',
        'S' => 'W',
        'W' => 'N'
      },
      'M' => {
        'N' => [0, 1],
        'S' => [0, -1],
        'E' => [1, 0],
        'W' => [-1, 0]
      }
    }

    rules[command]
  end

  def keep_into_planet
    if @world.is_outside_x?(@landing_zone[0])
      @landing_zone[0] = 0
    end

    if @world.is_outside_y?(@landing_zone[1])
      @landing_zone[1] = 0
    end
  end

end

class World
  attr_reader :x_coord, :y_coord

  def initialize(x, y)
    @x_coord = x
    @y_coord = y
  end

  def is_outside_x?(x)
    x > @x_coord
  end

  def is_outside_y?(y)
    y > @y_coord
  end
end