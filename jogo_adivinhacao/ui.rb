def print_intro()
    puts
    puts "            P"
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
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

def print_difficulties(difficulties)
    puts "********************************************************************************************"
    puts "DIFICULDADES"
    puts "********************************************************************************************\n\n"
    difficulties.each_with_index do |child, index| 
        child.each do |key, value| 
            puts "#{index + 1} - #{key} - de 0 a #{value[0]} em #{value[1]} tentativas" 
        end
    end
end

def ask_difficulty(difficulties)

    puts "\n********************************************************************************************\n\n"
    puts "Informe em qual nível de dificuldade deseja jogar (de 1 a 5): "
    difficulty = gets 
    while !(difficulty.strip !~ /\D/) || !difficulty.to_i.between?(1, 5)
        puts "A dificuldade precisa ser um número entre 1 e 5. Informe novamente: "
        difficulty = gets.strip
    end
    puts "\n"
    difficulty
end

def print_and_return_chosen_difficulty(difficulties, difficulty)
    difficulties[difficulty.to_i - 1].each { 
        |key, value| 
        puts "********************************************************************************************\n"
        puts "Você escolheu a dificuldade #{key} de 0 a #{value[0]} em #{value[1]} tentativas."
        return value[0], value[1]
    }
end

def print_out_of_range_shot(max_numbers)
    puts "Seu chute precisa ser um número entre 0 e #{max_numbers}."
end

def print_repeated_shot()
    puts "Você já chutou esse número."
end

def get_shot_number(max_numbers)
    puts "Dê o seu chute entre 0 e #{max_numbers}: "
    return gets.strip
end

def print_shot_number(input_number) 
    puts "\n"
    puts "Você chutou #{input_number}... Será que você acertou? "
    return input_number
end

def print_invalid_shot(bigger)
    puts "Não foi dessa vez :( - O número secreto é #{bigger ? "MENOR" : "MAIOR"} que o seu chute."
end

def print_trying(sequence, max_attempts, shots)    
    puts "\n"
    if shots.any? # if shots.size > 0
        puts "Tentativa #{sequence} de #{max_attempts} - Chutes anteriores #{shots}."
    else
        puts "Tentativa #{sequence} de #{max_attempts}"
    end
end

def print_win_and_points_or_lose(hit, points, secret_number, attempt) 
    puts "\n"
    puts "********************************************************************************************"
    puts "\n"
    if !hit 
        puts "HUUMMMM! Infelizmente suas chances acabaram! O número secreto era #{secret_number}. Tente novamente?"
    else
        puts "PARABÉNS!! Você acertou na #{attempt}a tentativa!!"
        puts
        puts "             OOOOOOOOOOO               "
        puts "         OOOOOOOOOOOOOOOOOOO           "
        puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
        puts "    OOOOOO      OOOOO      OOOOOO      "
        puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
        puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
        puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
        puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
        puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
        puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
        puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
        puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
        puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
        puts "         OOOOOO         OOOOOO         "
        puts "             OOOOOOOOOOOO              "
        puts
        puts "Você ganhou #{points} pontos nessa rodada."
    end
end

def available_play_again()
    puts "\n"
    puts "********************************************************************************************"
    puts "\n"
    puts "Informe S ou s para jogar novamente ou qualquer outra tecla para encerrar: "
    return gets.strip.upcase == "S"
end