# class Book
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def to_s
    puts "Book: #{@title}, #{@author}"
  end

end

