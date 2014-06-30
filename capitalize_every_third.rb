print "give me a sentnence"

sentence = gets.chomp

letters = sentence.split ""

capitalized = []

letters.each_with_index do |letter, index|
  if (index + 1) % 3 == 0
    capitalized << letter.capitalize
  else
    capitalized << letter
  end
end

puts capitalized.join
