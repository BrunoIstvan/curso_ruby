
tempo = 0
freio_acionado = true

puts '>>>> Usando while'
while freio_acionado
    puts "manter parado #{tempo}"
    tempo += 1
    freio_acionado = false if tempo == 10
end

# modos diferente
# puts "manter parado" while freio_acionado
# while freio_acionado? do puts "manter parado" end
# until freio_acionado? do puts "manter parado" end
=begin 
begin
    verificar_abs
    executa_parada
end while freio_acionado? 
=end

puts '>>>> Usando for com lista definida'
for i in [1, 2, 3]
    puts i
end

puts '>>>> Usando for in com range'
for i in 1..10
    puts i
end

puts '>>>> Usando each modo 1'
["maça", "banana", "uva"].each do |fruta| 
    puts fruta
end

puts '>>>> Usando each modo 2'
["laranja", "manga", "jaboticaba"].each { |fruta| puts fruta }

puts '>>>> Usando upto'
10.upto(20) { |num| puts num }


puts '>>>> Exemplo loop infinito'
loop do
    puts "Loop infinito acabará em #{20 - tempo}"
    tempo += 1
    break if tempo == 20
end

puts '>>>> Usando break'
["maça", "banana", "uva"].each do |fruta| 
    break if fruta == 'banana'
    puts fruta
end

puts '>>>> Usando next'
["maça", "banana", "uva"].each do |fruta| 
    next if fruta == 'banana'
    puts fruta
end

puts '>>>> Usando redo'
loop do
    puts "Informe um número: "
    input = gets.to_i
    redo if input > 10
    break
end
