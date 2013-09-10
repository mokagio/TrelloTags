require 'listen'

desc "Watches the sources for changes and recompiles"
task :watch do

	def coffee_compile(file)
		system "coffee --compile #{file}"
		puts "done."
	end

	def compile(file)
		if File.extname(file) == '.coffee'
			coffee_compile(file)	
		end
	end

	def path(file)
		if File.extname(file) == '.coffee'
			return file.gsub('.coffee', '.js')
		end
	end

	source_dir = '.'

	puts "recompiling everything"
	Dir.foreach(source_dir) do |file|
		compile file
	end

	puts "watching for changes in the sources.\n"
	Listen.to!(source_dir) do |modified, added, removed|

		modified.each do |file|
			puts "#{file} changed, recompiling..."
			compile file
		end

		added.each do |file|
			puts "added #{file}, compiling..."
			compile file
		end

		removed.each do |file|
			if File.extname(file) == '.coffee'
				puts "removed #{file}, removing compiled file as well"
				puts "rm #{path(file)}"
				system "rm #{path(file)}"
			end
		end
	end
end