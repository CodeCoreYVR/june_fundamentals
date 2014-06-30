print "Give me a sentence"

sentence = gets.chomp.split

capitalized = []

sentence.each do |x|
  capitalized << x.capitalize
end

puts capitalized.join(" ")
