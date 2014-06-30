prov_and_capitals = {"BC" => "Victoria", 
                     "AB" => "Edmonton", 
                     "SK" => "Regina"}

prov_and_capitals.each do |prov, cap|
  puts "The capital of #{prov} is #{cap}"
end