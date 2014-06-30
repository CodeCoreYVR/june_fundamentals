def largest_number(*numbers)
  big = 0
  numbers.each do |x|
    if x > big
      big = x
    end
  end
  big
end

def largest_number(*numbers)
  numbers.max
end

puts largest_number(5,4,5,6,7,8,9,9,9,10)