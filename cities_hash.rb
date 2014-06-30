cities = {"BC" => ["Vancouver", "Richmond"], 
          "AB" => ["Edmonton", "Calgary"]}

cities.each do |prov, prov_cities|
  puts "#{prov}: #{prov_cities.join(', ')}"
end