def print_intro()
    puts
    puts "            P"
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|      Jogo de Foge-Foge! "
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts "\n\n"
end

def get_player_name()
    puts "Informe seu nome: "
    name = gets.strip
    puts "Olá #{name.strip}! Vamos iniciar então...\n\n"
    name
end