class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date

  def initialize(params)
    @author_first_name = params[:author_first_name]
    @author_last_name = params[:author_last_name]
    @title = params[:title]
    @publication_date = params[:publication_date]
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    @publication_date.slice(-4..-1)
  end
end
