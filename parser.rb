class Parser
	attr_reader :words
	attr_accessor :debug
	attr_accessor :minlen

	def initialize(*args)
		@words = {}
		@debug = false
		@minlen = 3
	end

	def words_asc
		return @words.sort {|a1,a2| a1[1].to_i <=> a2[1].to_i }.to_h
	end

	def words_desc
		return @words.sort {|a1,a2| a2[1].to_i <=> a1[1].to_i }.to_h
	end

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

	def read_one(file)
		if @debug then puts "Reading #{file}" end

		fileObj = File.new(file, "r")
		while (line = fileObj.gets)
			line = line.unpack("C*").pack("U*").downcase
			line.gsub!(/[^a-z]/, ' ')
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

