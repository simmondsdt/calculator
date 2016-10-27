require 'pry'

puts "Hello, what is your name?"
name = gets.strip
puts "\n#{name}, welcome to the Ruby Calculator"
@hist_arr = []
@calc_arr = []
@mem_arr = []
@numbers = ['0','1','2','3','4','5','6','7','8','9']
@operations = ['+', '-', '*', '/']

def menu_options #displays menu for user
  puts "\n--- Calculator Menu ---"
  puts "1: Use Automatic Calculator"
  puts "2: Use Basic Calculator"
  puts "3: View Calculator History"
  puts "4: View Calculator Memory"
	puts "5: Quit\n"
  puts "What would you like to do?"
end

def auto_calculator #calculates the users input
  puts "What would you like to calculate?"
  calculation = gets.strip
  new_calculation = calculation.split(' ')
  @calc_arr = new_calculation
  if
    ((@numbers & @calc_arr).any? && (@operations & @calc_arr).any?)
    answer = @calc_arr.join(' ')
    final_answer = (eval(answer)).to_f
    return_answer = "#{calculation} = #{final_answer}"
    puts "The work for your calculation is #{return_answer}"
    @hist_arr << return_answer
    puts "Would you like to store to memory ('m')?"
    store = gets.strip.downcase
      if store == 'm'
        @mem_arr << return_answer
        puts "Successfully stored to memory."
        continue
      else
        menu
      end
  else
    puts "Please input valid numbers and operations"
  end
  menu
end

def calculator #shows basic calculator menu
  puts "Please select your operator #{@operations}"
  operator = gets.strip
  puts "What is the first number you would like to input?"
  number_one = gets.strip.to_f
  puts "What is the second number you would like to input?"
  number_two = gets.strip.to_f
  solution = eval("#{number_one} #{operator} #{number_two}")
  final = ("#{number_one} #{operator} #{number_two} = #{solution}")
  puts "Your answer is #{final}"
  puts "Would you like to store to memory ('m')?"
  store = gets.strip.downcase
    if store == 'm'
      @mem_arr << final
      puts "Successfully stored to memory."
      continue
    else
      menu
    end
  @hist_arr << final
end


# TODO: finish option to continue from memory
def continue
  puts "Would you like to continue from memory (y/n)?"
  cont = gets.strip.downcase
  case cont
    when 'y'
      puts " "
    else
      menu
  end
end

def history #displays history for user
  puts "-- Calculator History --"
  puts " "
  @hist_arr.each { |x| puts x }
  puts "Would you like to clear the history or go back to the main menu?"
  clear = gets.strip.downcase
  if clear == 'clear'
    @hist_arr.clear
    puts "History has been cleared"
  else
    menu
  end
end

def memory #puts memory for user
  puts "--- Calculator Memory ---"
  puts " "
  @mem_arr.each { |x| puts x }
    puts "Would you like to clear the memory or go back to the main menu?"
    clear = gets.strip
    if clear == 'clear'
      @mem_arr.clear
      puts "Memory has been cleared"
    else
      menu
    end
end

def menu #displays menu for user with options
  menu_options
  option = gets.strip.downcase
  case option
    when '1','automatic','automatic calculator'
      auto_calculator
    when '2','basic','basic calculator'
      calculator
    when '3','view','history','view calculator history'
      history
    when '4','view','memory','view calculator memory'
      memory
    when '5','quit'
      puts "Goodbye"
      exit
    else
      puts "Please choose an option"
  end
end

while true
  menu
end
