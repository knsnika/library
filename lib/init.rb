require_relative 'author.rb'
require_relative 'book.rb'
require_relative 'order.rb'
require_relative 'reader.rb'
require_relative 'library.rb'
#require_relative 'generate_file.rb'

book = Book.new('CLONE 2', "HJGIOS")
puts book

order = Order.new("xzchre", "John", 19.07)
puts order