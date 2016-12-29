def welcome
    puts "WelCome to guess' game" #print
    puts "What's your name?" 
    name = gets #gets text from console
    puts "Starting the game to you #{name}" 
end

def level
    puts "Choose level (1 - easy until 5 - hard)"
    gets.to_i
end

def to_draw_secret_number(level)
    case level
    when 1
        max = 30
    when 2
        max = 60
    when 3
        max = 100
    when 4
        max = 150
    when 5
        max = 200    
    end
        
    drawn = rand(max)
    puts "Choosing a secret number between 0 and #{max}"
    return drawn
end

def ask_number(guess_list, attempt) 
    puts "\n\n\n"
    puts "Attempt " + attempt.to_s
    puts "Have you tried #{guess_list}"
    puts "Enter a number:"
    guess = gets.strip #trim
    puts "Do you think you right? Your guess is " + guess # other way to print variable
    guess
end

def is_right(secret_number,guess)
    
    # verify if is right
    right = secret_number == guess.to_i #convert string in integer
    
    if  right
        puts "Right!"
        true
    else
        bigger = secret_number > guess.to_i
        if bigger
            puts "Secret number is high!"
        else
            puts "Secret number is less!"
        end
        false
    end
end 

def no_play_again?
    puts "Would you like play again, (Y/N)?"
    answer = gets.strip
    answer.upcase == "N"
end

def play(secret_number)
    
    limit_attempts = 5 #limit of attemps
    guess_list = []

    for attempt in 1..limit_attempts

        guess = ask_number(guess_list,attempt)
        #guess_list[attempt] = guess or guess_list << guess
        guess_list << guess.to_i
        if is_right(secret_number,guess)
            break
        end
    end
    
end

welcome
lvl = level
secret_number = to_draw_secret_number(lvl)

puts # breaks lines
puts "\n\n"# breaks lines

loop do 
    play(secret_number)
    if no_play_again?
        break
    end
end 
