a = 200
b = 100

if a > b
    puts 'a > b'
elsif a == b
    puts 'a == b'
else
    puts 'a < b'
end

puts 'a > b' if a > b
puts 'a > b' unless a < b
puts a > b ? 'a > b' : 'a < b' 
if  a > b then puts 'a > b' else puts 'a < b' end


    
marca = "tesla"
case marca
when "tesla"
    puts "TESLA"
when "ford"
    puts "FORD"
when "volks"
    puts "VOLKS"
when "fiat"
    puts "FIAT"
else
    puts "OUTROS"
end
