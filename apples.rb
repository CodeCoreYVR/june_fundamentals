module Computer
  # Apple the computer
  class Apple

    attr_accessor :type


  end
end


module Fruit
  # Apple the fruit
  class Apple

    attr_accessor :color


  end
end


mac      = Computer::Apple.new
mac.type = "Macintosh"

apple       = Fruit::Apple.new
apple.color = "Yellow"