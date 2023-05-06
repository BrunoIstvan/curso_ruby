require_relative 'ui.rb'
require_relative 'hero.rb'
require_relative 'map.rb'

def available_play_again()
    print_play_again()
    return gets.strip.upcase == "S"
end

def is_wall_position?(map, position)
    return map[position[0]][position[1]] == "+"
end

def is_ghost_position?(map, position)
    return map[position[0]][position[1]] == "F"
end

def is_valid_position?(map, position)
    lines = map.size
    cols = map[0].size

    explode_line = position[0] < 0 || position[0] >= lines
    explode_col = position[1] < 0 || position[1] > cols

    if explode_col || explode_line
        return false
    end

    if is_wall_position?(map, position) || is_ghost_position?(map, position)
        return false
    end

    return true

end

def copy_map(map)
    map.join("\n").tr("F", " ").split("\n")
end

def move_all_ghosts(map)
    char_ghost = "F"
    new_map = copy_map(map)
    map.each_with_index do |row_map, row_id|
        row_map.chars.each_with_index do |char, col_map|
            is_ghost = char == char_ghost
            if is_ghost
                move_ghost(map, new_map, row_id, col_map)
            end
        end
    end
    new_map
end

def move_ghost(map, new_map, row, col)
    positions = valid_positions_from(map, new_map, [row, col])
    return if positions.empty?

    position = positions[rand(positions.size)]

    map[row][col] = " "
    new_map[position[0]][position[1]] = "F"

end

def valid_positions_from(map, new_map, position)
    positions = []
    moves = [[-1, 0], [0, +1], [+1, 0], [0, -1]]
    moves.each do |move|
        new_position = [position[0] + move[0], position[1] + move[1]]
        if is_valid_position?(map, new_position) && is_valid_position?(new_map, new_position)
            positions << new_position
        end
    end
    positions
end

def play()
    map = Map.new
    map = map.read_map(1)
    print_intro()
    name = get_player_name()
    
    playing = true
    
    while playing

        draw_map(map)

        direction = ask_direction()
        hero = Hero.find_hero(map)

        if !hero
            print_game_over()
            break
        end
        
        new_hero_position = hero.calculate_new_position(direction)
        if !new_hero_position || !is_valid_position?(map, new_hero_position.to_array())
            next
        end

        hero.remove_of(map)
        new_hero_position.put_into(map)
    
        map = move_all_ghosts(map)

        
        # print_win_and_points_or_lose(hit, points, secret_number, attempts-1)
        # playing = available_play_again()

    end 

end