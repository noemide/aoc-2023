def get_max_for_color(color)
    if color == "red"
        return 12
    end
    if color == "blue"
        return 14
    end
    if color == "green"
        return 13
    end
end

def is_draw_valid(draw)
    counts = draw.split(",")
    counts.each do |count|
        x = count.split(" ")
        x_num = Integer(x[0])
        if (get_max_for_color(x[1]) < x_num)
            return false
        end
    end
    return true
end

def process_line_part1(line)
    parts = line.split(":")
    game_val = Integer(parts[0].split(" ")[1])
    draws = parts[1].split(";")
    draws.each do |draw|
        if !is_draw_valid(draw)
            return 0
        end
    end
    return game_val
end

def process_line_part2(line)
    red_cubes = 0
    blue_cubes = 0
    green_cubes = 0
    parts = line.split(":")
    draws = parts[1].split(";")
    draws.each do |draw|
        counts = draw.split(",")
        counts.each do |count|
           x = count.split(" ")
           cube_num = Integer(x[0])
           color = x[1]
            if color == "red"
                if cube_num > red_cubes
                    red_cubes = cube_num
                end
            end
            if color == "blue"
                if cube_num > blue_cubes
                    blue_cubes = cube_num
                end
            end
            if color == "green"
                if cube_num > green_cubes
                    green_cubes = cube_num
                end
            end
        end
    end
    return red_cubes*blue_cubes*green_cubes
end

counter = 0
File.readlines('input.txt').each do |line|
    counter += process_line_part2(line)
end

puts counter