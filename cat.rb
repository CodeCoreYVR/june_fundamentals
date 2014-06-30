class Cat
  attr_reader :name
  attr_accessor :caught_birds

  def initialize(name)
    @name         = name
    # initializing an array to store the birds caught
    @caught_birds = []
  end

  def catch(bird)
    # checking that bird parameter is actually of type Bird
    if bird.is_a? Bird
      # adding the passed bird to the array of birds
      @caught_birds.push bird
      puts "Caught a bird #{bird.name}"
    else
      puts "This is not a bird"
    end
  end

  def eat
    # checking the size of caught_birds array to make sure there are
    # birds to eat
    if @caught_birds.size == 0
      puts "No birds to eat"
    else
      # Popping the last element from the array to eat it
      bird = @caught_birds.pop
      puts "Eating bird #{bird.name}"
    end
  end

end