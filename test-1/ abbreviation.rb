def generate_abbreviation(words)
  result = ""
  words.split.each { |word| result += word[0].upcase }
  result
end

puts "Enter a list of words separated by spaces:"
words = gets.chomp
abbreviation = generate_abbreviation(words)
puts abbreviation