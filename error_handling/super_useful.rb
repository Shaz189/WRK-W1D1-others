# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    return nil
  end
    num
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class FruitError < StandardError; end
class CoffeeError < StandardError; end

def reaction(maybe_fruit)
  raise CoffeeError.new("Not fruit but coffee. Try again") if maybe_fruit == "coffee"
  raise FruitError.new("not a fruit") unless FRUITS.include?(maybe_fruit)
  puts "OMG, thanks so much for the #{maybe_fruit}!"
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => err
    puts err.message
    retry
  rescue FruitError => err
    puts err.message
  end

end  

def get_input
  begin
    puts "what is the name"
    name = gets.chomp
    puts "how long have you known them"
    yrs_known = gets.chomp.to_i
    puts "favorite pastime"
    fav_pastime = gets.chomp
    friend_reactions(var, name, yrs_known, fav_pastime)
  rescue NameError => err 
    p err.message
    retry
  rescue YearsError => err 
    p err.message
    retry
  rescue PastError => err 
    p err.message
    retry
  end
end

def friend_reactions(name, yrs_known, fav_pastime)
  raise NameError.new("Needs name.") if name.length == 0
  raise YearsError.new("Needs 5 years min") if yrs_known < 5
  raise PastError.new("Need pastime") if fav_pastime.length == 0
  BestFriend.new(name, yrs_known, fav_pastime)
end

class NameError < StandardError; end
class YearsError < StandardError; end
class PastError < StandardError; end
# PHASE 4
class BestFriend

  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
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


