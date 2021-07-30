class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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

  def checkout(book)
    if @books.include?(book)
      if book.checked_out? == false
        book.check_out
        return true
      else book.checked_out? == true
        false
      end
    else
      false
    end
  end

  def checked_out_books
    @books.each do |book|
      if book.checked_out? == true
        @checked_out_books << book
      end
    end
    @checked_out_books
  end

  def return(book)
    book.check_in
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.max_by { |book| book.circ_count}
  end
end
