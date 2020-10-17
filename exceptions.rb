def divide(a, b)
    raise "Divisão por zero é inválida" if b == 0
    a / b
end

puts '>>>> Não será lançada uma exceção'
puts divide 100, 5

puts '>>>> Será lançada uma exceção'
begin
    puts divide 100, 0    
rescue Exception => e
    puts "Erro ao dividir: #{e.message}"
end

puts '>>>> Será lançada uma exceção e tratada - exemplo 1'
begin
    valor = divide 100, 0    
rescue Exception => e
    puts "Erro ao dividir: #{e.message}"
else
    puts "O valor da divisão é #{valor}"
ensure
    puts "Essa linha sempre será executada"
end

puts '>>>> Será lançada uma exceção e tratada - exemplo 2'
begin
    valor = divide 100, 20    
rescue Exception => e
    puts "Erro ao dividir: #{e.message}"
else
    puts "O valor da divisão é #{valor}"
ensure
    puts "Essa linha sempre será executada"
end