##
# This Parser counts the number of words in a file (or files in a directory)
#
# myParser = Parser.new
#
# myParser.debug = true
# myParser.minlen = 3
# myParser.wordchars = 'a-z0-9' 
#
# myParser.read('file')
#
# puts myParser.words_asc
# puts myParser.words_desc

class Parser

	attr_reader :words
	attr_accessor :debug
	attr_accessor :minlen
	attr_accessor :wordchars

	def initialize(*args)
		@words = {}
		@debug = false
		@minlen = 3
		@wordchars = 'a-z0-9'
	end

	# Sorts the words hash by appearance count and returns it in ascending order
	#

	def words_asc
		return @words.sort {|a1,a2| a1[1].to_i <=> a2[1].to_i }.to_h
	end

	# Sorts the words hash by appearance count and returns it in descending order
	#

	def words_desc
		return @words.sort {|a1,a2| a2[1].to_i <=> a1[1].to_i }.to_h
	end

	# Given a file or filepath read the data into the words hash
	#

	def read(item)
		if File.directory?(item) 
			Dir.foreach(item) do |nxt|
				next if nxt == '.' or nxt == '..'
				read("#{item}/#{nxt}")
			end
		else
			read_one(item)
		end
	end

	private

	# read_one is a private method that actually (and only reads a single file)
	#

	def read_one(file)
		if @debug then puts "Reading #{file}" end

		fileObj = File.new(file, "r")
		while (line = fileObj.gets)
			line = line.unpack("C*").pack("U*").downcase
			line.gsub!(/[^#{wordchars}]/, ' ')

			line.split(" ").each do |word|
				next if word.length < @minlen

				if @words.has_key?(word)
					@words[word] = @words[word] + 1
				else
					@words[word] = 1
				end
			end
		end
		fileObj.close
	end

end

