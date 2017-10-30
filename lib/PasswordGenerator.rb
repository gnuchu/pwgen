require 'optparse'

class PasswordGenerator
  attr_accessor :numberchars, :specialchars, :lowercase, :uppercase

  def initialize(args = {})
    @lowercase = *('a'..'z')
    @uppercase = *('A'..'Z')
    @numberchars = *(0..9)
    @specialchars = ["!", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "]", "}", "[", "{", "#", "~", "'", "@", ";", ":", "/", "?", ".", ">", ",", "<", "|"]
    
    @length = args.fetch(:length, 20)
    
    lower = args.fetch(:lower, true)
    upper = args.fetch(:upper, true)
    numbers = args.fetch(:numbers, true)
    special = args.fetch(:special, true)

    @chars = characters(lower, upper, numbers, special)
  end

  def characters(lower, upper, numbers, special)
    chars = []
    if(lower)
      chars += @lowercase
    end

    if(upper)
      chars += @uppercase
    end

    if(numbers)
      chars += @numberchars
    end

    if(special)
      chars += @specialchars
    end

    return chars.shuffle!
  end

  def generate
    str = ''
    @length.times do 
      str += @chars[rand(@chars.size)].to_s
    end
    str
  end
end