
def get_line_cal_val_part1(line)

    first_digit = nil
    last_digit = nil

    line.each_char do |char|
        if char.match?(/[[:digit:]]/)
            if first_digit.nil?
                first_digit = char
            end
            last_digit = char
        end
    end
    return Integer([first_digit, last_digit].join)
end

def get_line_cal_val_part2(line)
    text_to_int = {"one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"}


    #First find digit candidates
    first_digit = nil
    first_dight_pos = 1000
    last_digit = nil
    last_digit_pos = 0

    line.each_char.with_index do |char, i|
        if char.match?(/[[:digit:]]/)
            if first_digit.nil?
                first_digit = char
                first_dight_pos = i
            end
            last_digit = char
            last_digit_pos = i
        end
    end

    #Random large number (must be larger then longest input line)
    first_word_pos = 1000
    first_word_val = nil
    last_word_pos = 0
    last_word_val = nil
    #Now find word candidates
    text_to_int.keys.each do |num_word|
        curr_first_word_pos = line.index(num_word)
        curr_last_word_pos = line.rindex(num_word)
        unless curr_first_word_pos.nil?
            if curr_first_word_pos <= first_word_pos
                first_word_pos = curr_first_word_pos
                first_word_val = text_to_int[num_word]
            end
            if curr_last_word_pos >= last_word_pos
                last_word_pos = curr_last_word_pos
                last_word_val = text_to_int[num_word]
            end
        end
    end

    #Determine wheather word or digit is first/last and overwrite if word wins
    if first_word_pos < first_dight_pos
        first_digit = first_word_val
    end

    if last_word_pos > last_digit_pos
        last_digit = last_word_val
    end

    return Integer([first_digit, last_digit].join)
end

cal_sum = 0
File.readlines('input.txt').each do |line|
    cal_sum += get_line_cal_val_part2(line)
end
puts cal_sum 