require File.expand_path('../../lib/mars', __FILE__)

class App
  def initialize(type, input = "")
    @type = type
    @input = input
  end

  def run
    if @type == :batch
      plateau = Mars.new @input
    else
      input = STDIN.read
      puts input
      plateau = Mars.new input
    end

    plateau.move_rovers

    puts plateau
  end
end