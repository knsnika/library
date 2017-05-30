# class Library

require 'yaml'

require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require_relative '../generate_file'

class Library
  include Faker

  attr_accessor :books, :orders, :readers, :authors

  def initialize(books = [], orders = [], readers = [], authors = [])
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def export_data(file = 'data.yml')
    File.new(file, 'w') unless File.exist?(file)
    File.open(file, 'w') { |data| data.write to_yaml }
  end
  
  def import_data(file = 'data.yml')
    data = YAML.load_file(file)
    @books = data.books
    @orders = data.orders
    @readers = data.readers
    @authors = data.authors
  end
  
  def top_book
    top(1, :book).title
  end

  def book_lover
    top(1, :reader).name
  end

  def top_book_lovers
  	top(3, :book) do |books|
      @orders.flat_map { |order| order.reader if books.include?(order.book) }
             .compact.uniq.size
    end
  end

  private

  def top(nummer, method)
    result = @orders.group_by(&method)
                 .max_by(number) { |_, orders| orders.size }
                 .to_h.keys

    number == 1 ? result.first : result
  end

end
