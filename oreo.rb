require "./cookie.rb"

# Oreo Class inherits from the Cookie class
# Cookie is called here parent class or super class
# Oreo is called child class or sub class
class Oreo < Cookie

  attr_accessor :filling_type


  def info
    puts "Oreo Cookie with #{sugar_amount}g of Sugar and #{flour_amount}g of 
      flour and #{filling_type} filling"
    super
  end

end