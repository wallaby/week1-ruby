# frozen_string_literal: true

def guesser
  max_guess = 10
  my_num = rand(max_guess) + 1
  puts("Please guess a number between 1 and #{max_guess}:")
  guess = gets.to_i
  if guess < my_num
    puts "Too low (#{my_num})."
  elsif guess > my_num
    puts "Too high (#{my_num})."
  else
    puts 'You\'ve got it!'
  end
end

guesser
