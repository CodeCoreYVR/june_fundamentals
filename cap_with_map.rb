names = ["jeff", "john", "tom"]

puts names.map {|x| x.capitalize.reverse }

puts names.map!(&:capitalize).map!(&:reverse)

array = [1,2,3,4,5]

# these two are identical
array.map {|x| x.odd? }
array.map(&:odd?)
