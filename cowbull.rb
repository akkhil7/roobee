#Cow and Bull Game
@flag = true
@won = false
@arr = [1,2,3,4,5,6,7,8,9]
@number = ""
puts "Welcome to my stupid Cow and Bull game. You have got 20 guesses to guess the number"
puts "-" * 30

4.times do
  l = @arr.length
  index = rand(0..l-1)
  @number = @number.concat(@arr[index].to_s)
  @arr.delete(@arr[index])
  @arr.compact
end

@number = @number.to_i
temp = @number

a = temp.to_s
digits = Array.new
a.each_char {|c| digits.push(c.to_i)}

#digits = random number digits
20.times do
  print "Enter your guess < "
  guess = gets.to_i
  guess_temp = guess.to_s
  guess_digits = Array.new
  guess_temp.each_char {|d| guess_digits.push(d.to_i) }

  #guess_digits = guess number digits
  @cows = 0
  @bulls = 0
  puts ""
  for i in 0..3
    for j in 0..3
      if digits[j] == guess_digits[i]
        if i == j
          @bulls = @bulls+1
        else
          @cows = @cows+1
        end
      end
    end
  end

  if @bulls == 4
    puts "You've won the game. The number was #{@number}."
    @won = true
    break
  else
    puts "There are #{@cows}C and #{@bulls}B in your guess"
  end

end

if !@won
  puts "You've lost the game. Sorry!"
end
