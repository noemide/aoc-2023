def get_line_cal_val(line)

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

cal_sum = 0
File.readlines('input.txt').each do |line|
    cal_sum += get_line_cal_val(line)
end
puts cal_sum 