my_array = [[1,2,3],[1,2,3],[1,2,3],[1,2,3]]

my_array.flatten.each do |x|
  puts x
end

puts my_array.flatten

my_array.each do |x|
  x.each do |y|
    puts y
  end
end