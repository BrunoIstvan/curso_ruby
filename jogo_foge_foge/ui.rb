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

def print_play_again()
    puts "\n"
    puts "********************************************************************************************"
    puts "\n"
    puts "Informe S ou s para jogar novamente ou qualquer outra tecla para encerrar: "
end

def draw_map(map)
    puts map
end

def ask_direction()
    puts "Para onde deseja ir?"
    direction = gets.strip.upcase
end

def print_game_over()
    puts "\n\n\n\n\n\n"
    puts "Game Over"
end
