## VERSION 2
class Rectangle

  attr_reader :area

  def initialize(width, height)
    @width, @height = width, height
    # Precalculates the area and sets it to instance variable
    @area           = width * height
  end


end

## VERSION 1
# class Rectangle
#   attr_accessor :width
#   attr_accessor :height

#   def initialize(width, height)
#     @width, @height = width, height
#   end

#   def area
#     width * height
#   end

# end