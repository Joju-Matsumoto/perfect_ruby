require 'faker'

class Book
  include Comparable

  attr_reader :title, :year

  def initialize(**attr)
    @title = attr[:title]
    @year = attr[:year]
  end

  def <=>(other)
    less = 0
    less = @year <=> other.year if less.zero?
    less = @title <=> other.title if less.zero?
    less
  end
end

books = 5.times.map do
  book = Book.new title: Faker::Book.title, year: Random.rand(1993..2022)
end

books.each { |b| p b }
books.sort!
books.each { |b| p b }
