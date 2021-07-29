class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(historical_author)
    years = []
    @authors.each do |author|
      if author == historical_author
        author.books.each do |book|
          years << book.publication_year.to_i
        end
      end
    end
    years.sort!
    {start: years.first.to_s, end: years.last.to_s}
  end
end
