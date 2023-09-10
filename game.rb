def foo(player_element)
  elements = %w[Scissors Paper Stone]
  if !elements.include?(player_element)
    puts "Enter an existing value"
  else
    bot_element = elements.sample
    puts bot_element
    if player_element == bot_element
      puts "It's draw"
    elsif (player_element == "Scissors" && bot_element == "Paper") ||
          (player_element == "Paper" && bot_element == "Stone") ||
          (player_element == "Stone" && bot_element == "Scissors")
      puts "You win"''
    else
      puts "You lose"
    end
  end
end

  
foo(ARGV[0])