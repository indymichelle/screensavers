require "bundler"
Bundler.require(:default)



puts "Prepare to be MYSTIFIED!!!!!!!"


class Screensaver < Gosu::Window
  WIDTH  = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Mystify"

    @shape = Shape.new(self)
  end

  def draw
    @shape.draw
  end

  def update
    @shape.update
  end
end

class Shape
  def initialize(window)
    @window = window
    @x1 = 640
    @x2 = 0
    @y1 = 0
    @y2 = 480
    @dx = -1
  end

  def draw
    @window.draw_line( @x1, @y1, 0xff0000ff, @x2, @y2, 0xff0000ff)
  end

  def update
    if @x1 <=0
      @dx =1
    elsif @x1 >=640
      @dx = -1
    end
    @x1 = @x1 + @dx

  end

end

window = Screensaver.new
window.show
