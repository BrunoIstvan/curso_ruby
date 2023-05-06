class Hero

    attr_accessor :row, :col

    def calculate_new_position(direction)
        new_hero = self.dup
        moves = {
            "W" => [-1, 0],
            "S" => [+1, 0],
            "A" => [0, -1],
            "D" => [0, +1]
        }
        move = moves[direction]
        return if !move 
        new_hero.row += move[0]
        new_hero.col += move[1]
        new_hero
    end

    def to_array()
        [row, col]
    end

    def remove_of(map)
        map[self.row][self.col] = " "
    end

    def put_into(map)
        map[self.row][self.col] = "H"
    end

    def self.find_hero(map)
        char_hero = "H"
        map.each_with_index do |row_map, row_id| 
            col_hero = row_map.index(char_hero)
            if col_hero
                hero = Hero.new
                hero.row = row_id
                hero.col = col_hero
                return hero
            end
        end
        nil
    end
    
end