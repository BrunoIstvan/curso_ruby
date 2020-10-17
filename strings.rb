marca = 'jeep'
modelo = "renegade"
motor = 2.0

puts "#{marca} #{modelo} tem motor #{motor}"

texto = <<EOS
Bruno
curte
demais
Rock
e
aprender
linguagens
de
programação
EOS

puts texto

nome = "Bruno Istvan"
puts nome

nome["Bruno"] = "Nuno"
puts nome

puts nome.downcase
puts nome.upcase
puts (" " + nome + " ").strip

nome.downcase!

puts nome.capitalize

puts nome.split
