puts "What appears if number is divisible by 3?"
div_3 = gets.chomp

puts "What appears if number is divisible by 5?"
div_5 = gets.chomp

results = []

for x in 1..100
  if x % 3 == 0 && x % 5 == 0
    results.push "#{div_3}#{div_5}"
  elsif x % 5 == 0
    results.push div_5
  elsif x % 3 == 0
    results.push div_3
  else
    results.push x
  end
end

puts results
