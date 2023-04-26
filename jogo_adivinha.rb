def print_intro()
    puts
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
    puts "Olá #{remove_new_line(name)}! Vamos iniciar então...\n\n"
    name
end

def get_difficulties()
    return [
        { "MUITO FÁCIL": 30 }, 
        { "FÁCIL": 60 }, 
        { "MÉDIO": 100 }, 
        { "DIFÍCIL": 150 }, 
        { "MUITO DIFÍCIL": 200 } 
    ]
end

def print_difficulties(difficulties)
    puts "**********************************************"
    puts "DIFICULDADES"
    puts "**********************************************\n\n"
    difficulties.each_with_index do |child, index| 
        child.each do |key, value| 
            puts "#{index + 1} - #{key} - de 0 a #{value}" 
        end
    end
end

def ask_difficulty()

    difficulties = get_difficulties()
    print_difficulties(difficulties)

    puts "\n**********************************************\n\n"
    puts "Informe em qual nível de dificuldade deseja jogar (de 1 a 5): "
    difficulty = gets 
    while difficulty !~ /\D/ || !difficulty.to_i.between?(1, 5)
        puts "A dificuldade do jogo precisa ser um número entre 1 e 5. Informe novamente: "
        difficulty = gets
    end
    puts "\n"
    difficulties[difficulty.to_i - 1].each { 
        |key, value| 
        puts "**********************************************\n"
        puts "Você escolheu a dificuldade #{key} de 0 a #{value}."
        return value
    }
end

def print_trying(sequence, max_attempts, shots)    
    puts "\n"
    if shots.any? # if shots.size > 0
        puts "Tentativa #{sequence} de #{max_attempts} - Chutes anteriores #{shots}."
    else
        puts "Tentativa #{sequence} de #{max_attempts}"
    end
end

def get_shot_number(shots, max_numbers)
    puts "Dê o seu chute entre 0 e #{max_numbers}: "
    input_number = gets

    loop do
        if !(input_number.strip !~ /\D/) || !input_number.to_i.between?(0, max_numbers)
            puts "Seu chute precisa ser um número entre 0 e #{max_numbers}. Chute novamente: "
            input_number = gets
            next
        end
        if shots.include?(input_number.to_i)
            puts "Você já chutou esse número. Chute novamente: "
            input_number = gets
            next
        end
        break
    end

    puts "\n"
    puts "Você chutou #{remove_new_line(input_number)}... Será que você acertou? "
    return input_number.to_i
end

def available_shot(number, secret, attempt)
    correct = number == secret
    if !correct
        bigger = number > secret
        puts "Não foi dessa vez :( - O número que você chutou é #{bigger ? "MAIOR" : "MENOR"} que o número secreto."
        return false
    end
    return true
    
end

def remove_new_line(word)
    return word.gsub("\n", "")
end

def generate_secret_number(max_attempts)
    return rand(max_attempts)
end

def print_win_and_points_or_lose(hit, points, secret_number, attempt) 
    puts "\n"
    puts "**********************************************"
    puts "\n"
    if !hit 
        puts "HUUMMMM! Infelizmente suas chances acabaram! O número secreto era #{secret_number}. Tente novamente?"
    else
        puts "Parabéns!! Você acertou na #{attempt}a tentativa!!"
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
    puts "**********************************************"
    puts "\n"
    puts "Informe S ou s para jogar novamente ou qualquer outra tecla para encerrar: "
    try_again = remove_new_line(gets)
    return try_again.upcase == "S"
end

def calculate_points(points, input_number, secret_number)
    points -= (input_number - secret_number).abs * 0.5
end

def play()

    print_intro()
    name = get_player_name()
    
    playing = true
    
    while playing

        max_attempts = 5 
        max_numbers = ask_difficulty()
        secret_number = generate_secret_number(max_numbers)
        
        points = 1000
        shots = []
        attempts = 1
        hit = false

        while attempts <= max_attempts && hit == false

            print_trying(attempts, max_attempts, shots)
            input_number = get_shot_number(shots, max_numbers)
            points = calculate_points(points, input_number, secret_number)
            shots << input_number
            hit = available_shot(input_number, secret_number, attempts)
            attempts += 1

        end
        
        print_win_and_points_or_lose(hit, points, secret_number, attempts-1)

        playing = available_play_again()

    end 

end

play()