a = "hello codecore students"

letters = a.split("")

letters_counter_hash = Hash.new(0) 

letters.each do |letter|
  puts "letters_counter_hash: #{letters_counter_hash}"
  letters_counter_hash[letter] += 1
end

# puts letters_counter_hash
# {"h"=>1, "e"=>4, "l"=>2, "o"=>3, " "=>2, "c"=>2, "d"=>2, "r"=>1, "s"=>2, "t"=>2, "u"=>1, "n"=>1}

display = 0
highest_recurring_letter = ""

letters_counter_hash.each do |letter, occurances|
  if display < occurances
    highest_recurring_letter = letter
    display = occurances
  end 
end

puts highest_recurring_letter

