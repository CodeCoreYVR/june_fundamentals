class Computer

  def initialize(brand, memory, cpu_power)
    @brand = brand
    @memory = memory
    @cpu_power = cpu_power
  end

  def specs
    puts "Brand: #{@brand}"
    puts "Memory: #{@memory}"
    puts "CPU Power: #{@cpu_power}"
  end

end