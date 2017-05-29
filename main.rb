require_relative 'lib/library.rb'

library = Library.new

if File.exist?('data.yml')
  library.import_data
else
  library.generate
end

puts "Top reader: #{library.book_lover}"
puts "Top book: #{library.top_book}"
puts "Number of people ordered one of the three most popular books: 
#{library.top_book_lovers}"
