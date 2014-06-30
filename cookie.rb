# class keyword is used to define a class
# Cookie is the class name
# uses camel case
class Cookie

  def initialize(sugar_amount, flour_amount)
    # defining instance variables accessible in other
    # instance methods private or public
    @flour_amount = flour_amount
    @sugar_amount = sugar_amount
  end

  attr_accessor :type
  attr_accessor :flour_amount
  # this is the same as:
  # attr_reader :flour_amount
  # attr_writer :flour_amount

  # This is called a "getter" method
  attr_reader :sugar_amount
  # equivelent to
  # def sugar_amount
  #   @sugar_amount
  # end

  # This is called a "setter" method
  attr_writer :sugar_amount
  # equivelent to
  # def sugar_amount=(value)
  #   @sugar_amount = value
  # end

  def info
    puts "Cookie with #{@sugar_amount}g of sugar and #{@flour_amount}g of flour"
  end

  # Defining a public method
  def bake_and_eat
    bake # Can call private method from here
    eat
  end

  # defines a class method that can be called as:
  # Cookie.who_are_you
  def self.who_are_you
    puts "I'm a cookie class"
  end

  # Any method defined after the 'private' keyword
  # will be a private mehtod
  private

  def bake
    puts "Baking the cookie..."
  end

  def eat
    puts "Eating the cookie.."
  end

end


# first name
# snake case: first_name
# Camel Case: FirstName
# Scream Case: FIRST_NAME