class Car

  def initialize(model_type, capacity)
    @model_type = model_type
    @capacity   = capacity
  end

  def drive
    ignite_engine
    puts "Driving.."
  end

  def stop
    puts "Stopped"
  end

  def park
    puts "Parked"
  end

  def self.max_speed
    puts 200
  end

  private

  def pump_gas
    puts "pumping gas"
  end

  def ignite_engine
    puts "ingiting engine.."
  end

end