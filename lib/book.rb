class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date
              :is_checked_out

  def initialize(params)
    @author_first_name = params[:author_first_name]
    @author_last_name = params[:author_last_name]
    @title = params[:title]
    @publication_date = params[:publication_date]
    @is_checked_out = false
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    @publication_date.slice(-4..-1)
  end

  def checked_out?
    @is_checked_out
  end

  def check_out
    @is_checked_out = true
  end
end
