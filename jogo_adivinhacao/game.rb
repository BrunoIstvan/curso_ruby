require_relative 'ui.rb'

def calculate_points(points, input_number, secret_number)
    points -= (input_number - secret_number).abs * 0.5
    points
end

def generate_secret_number(max_attempts)
    return rand(max_attempts)
end

def available_shot(number, secret, attempt)
    correct = number == secret
    if !correct
        bigger = number > secret
        print_invalid_shot(bigger)
        return false
    end
    return true
end

def get_difficulties()
    return [
        { "MUITO FÁCIL": [30, 5] }, 
        { "FÁCIL": [60, 6] }, 
        { "MÉDIO": [100, 7] }, 
        { "DIFÍCIL": [150, 7] }, 
        { "MUITO DIFÍCIL": [200, 7] } 
    ]
end

def available_range_of_shot_number(input_number, max_numbers, shots)

    loop do
        if !(input_number.strip !~ /\D/) || !input_number.to_i.between?(0, max_numbers)
            print_out_of_range_shot(max_numbers)
            input_number = get_shot_number(max_numbers)
            next
        end
        break
    end

end

def available_is_repeated_shot(input_number, max_numbers, shots)

    loop do
        if shots.include?(input_number.to_i)
            print_repeated_shot()
            input_number = get_shot_number(max_numbers)
            next
        end
        break
    end

end

def play()

    print_intro()
    name = get_player_name()
    
    playing = true
    
    while playing

        # max_attempts = 5 
        difficulties = get_difficulties()
        print_difficulties(difficulties)
        difficulty = ask_difficulty(difficulties)
        max_numbers, max_attempts = print_and_return_chosen_difficulty(difficulties, difficulty)
        secret_number = generate_secret_number(max_numbers)
        
        points = 1000
        shots = []
        attempts = 1
        hit = false

        while attempts <= max_attempts && hit == false

            print_trying(attempts, max_attempts, shots)
            input_number = get_shot_number(max_numbers)
            available_range_of_shot_number(input_number, max_numbers, shots)
            available_is_repeated_shot(input_number, max_numbers, shots)
            input_number = print_shot_number(input_number.to_i)
            points = calculate_points(points, input_number, secret_number)
            shots << input_number
            hit = available_shot(input_number, secret_number, attempts)
            attempts += 1

        end
        
        print_win_and_points_or_lose(hit, points, secret_number, attempts-1)
        playing = available_play_again()

    end 

end