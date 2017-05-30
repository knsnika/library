#module GenerateFile

require 'faker'

module GenerateFile
  def generate
    generate_authors
    generate_books
    generate_readers
    generate_orders
  end

  def generate_authors
    @authors = []
    rand(5..6).times do
      @authors << Author.new(
        Faker::Book.author,
  	    Faker::Lorem.sentence(1)
      )
   end 
  end

  def generate_orders
    @orders = []
    rand(5..9).times do
      @orders << Order.new(
        Faker::Name.name,
        Faker::Book.title,
        Faker::Date.backward(14)
      )
    end
  end

  def generate_readers
    @readers = []
    rand(5..9).times do
      @readers << Reader.new(
        Faker::Name.name,
        Faker::Internet.free_email,
        Faker::Address.city,
        Faker::Address.street_name,
        Faker::Address.building_number
      )
    end
  end

  def generate_books
    @books = []
    rand(7...9).times do
      @books << Book.new(
        Faker::Book.title,
  	    Faker::Book.author
      )
    end
  end
end
