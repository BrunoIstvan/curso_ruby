lista = [1, 5, 3, 9, 0, 2, 4]
puts lista

puts ''
lista.each do |i|
    puts i
end

puts ''
lista.each { |i| puts i }

puts ''
puts lista.sort

puts ''
puts lista.reduce(0) {|resultado, proximo| resultado + proximo }

puts ''
puts lista.map {|num| num * num}