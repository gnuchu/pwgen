require 'optparse'
require_relative '../lib/PasswordGenerator.rb'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: pwgen.rb [options]"

  opts.on("--length N", Integer, "Password Length") do |l|
    options[:length] = l
  end

  opts.on("-u", "--no-upper", "Exclude Uppercase Characters") do |u|
    options[:upper] = false
  end

  opts.on("-l", "--no-lower", "Exclude Lowercase Characters") do |u|
    options[:lower] = false
  end

  opts.on("-n", "--no-numbers", "Exclude Number Characters") do |u|
    options[:numbers] = false
  end

  opts.on("-s", "--no-special", "Exclude Special Characters") do |u|
    options[:special] = false
  end
end.parse!

length = options.fetch(:length, 20)
lower = options.fetch(:lower, true)
upper = options.fetch(:upper, true)
numbers = options.fetch(:numbers, true)
special = options.fetch(:special, true)

p = PasswordGenerator.new(length: length, upper: upper, lower: lower, nubmers: numbers, special: special)
puts
puts p.generate
puts

