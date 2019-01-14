# PHASE 2
def convert_to_int(str)
  begin 
    Integer(str)
  rescue ArgumentError 
    puts "Incorrect type"
    return nil 
  end 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError; end 

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else   
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp   
    reaction(maybe_fruit) 
  rescue CoffeeError
    puts "Yum! I love coffee! But try again with a fruit :)"
    retry
  rescue StandardError
    puts "ARRRG! #{maybe_fruit} is not a fruit! Get OUT :)"
  end 
    
end  

# PHASE 4

class NumYearsError < StandardError; end 

class MissingArgError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise MissingArgError.new("Invalid name length") if name.length <=0
    @yrs_known = yrs_known
    raise NumYearsError if yrs_known < 5
    @fav_pastime = fav_pastime
    raise MissingArgError.new("Invalid pastime length") if fav_pastime.length <=0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


