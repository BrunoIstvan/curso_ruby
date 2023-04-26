require_relative 'ui.rb'

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