def roman_to_integer(roman)
  roman_numerals = {
    'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
    'C' => 100, 'D' => 500, 'M' => 1000
  }

  integer = 0
  prev_value = 0

  roman.reverse.each_char do |char|
    value = roman_numerals[char]
    if value < prev_value
      integer -= value
    else
      integer += value
    end
    prev_value = value
  end

  integer
end

def integer_to_roman(integer)
  roman_numerals = {
    1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
    100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
    10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
  }

  roman = ''

  roman_numerals.each do |value, numeral|
    while integer >= value
      roman += numeral
      integer -= value
    end
  end

  roman
end

puts "Enter a Roman numeral or integer from 1 to 4000:"
input = gets.chomp

if input =~ /^[IVXLCDM]+$/i
  result = roman_to_integer(input.upcase)
  puts "Integer: #{result}"
elsif input =~ /^[0-9]+$/
  result = integer_to_roman(input.to_i)
  puts "Roman numeral: #{result}"
else
  puts "Error"
end
