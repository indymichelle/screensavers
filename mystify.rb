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
    @dx1 = -1
    @dx2 = -1
    @dy1 = -1
    @dy2 = -1
  end

  def draw
    @window.draw_line( @x1, @y1, 0xff0000ff, @x2, @y2, 0xff0000ff)
  end

  def update
    if @x1 <=0
      @dx1 =1
    elsif @x1 >=640
      @dx1 = -1
    end
    @x1 = @x1 + @dx1

    if @x2 <=0
      @dx2 =1
    elsif @x2 >=640
      @dx2 = -2
    end
    @x2 = @x2 + @dx2

    if @y1 <=0
      @dy1 =0.5
    elsif @y1 >=480
      @dy1 = -0.5
    end
    @y1 = @y1 + @dy1

    if @y2 <=0
      @dy2 =0.75
    elsif @y2 >=480
      @dy2 = -0.75
    end
    @y2 = @y2 + @dy2

  end

end

window = Screensaver.new
window.show
