require_relative 'parser'

# Create a new parser class instance
#
myParser = Parser.new
#myParser.debug = true
myParser.minlen = 4

# For each item passed on command line process it
# It can be a single file or a directory
#
ARGV.each do |item|
	myParser.read(item)
end

# Grab and display the 10 most common words in the data processed
#

myParser.words_desc.first(10).each do |word,count|
	puts "The word #{word} appears #{count} times"
end
