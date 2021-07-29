require './lib/book'

RSpec.describe Book do
  context "it's a book" do
    book = Book.new({ author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})

    it "exists" do
      expect(book).to be_a(book)
    end

    it "has attributes" do
      expect(book.title).to eq("To Kill a Mockingbird")
      expect(book.author).to eq("Harper Lee")
    end

    it "has a publication_year" do
      expect(book.publication_year).to eq("1960")
    end
  end

end

# Use TDD to create a `Book` class that responds to the following interaction pattern.
# For the `publication_year` method, assume that the year is always the last four
# characters of the publication date.
#
# require './lib/book'
# #=> true
#
# book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
# #=> #<Book:0x00007fcc021fad08...>
#
# book.title
# #=> "To Kill a Mockingbird"
#
# book.author
# #=> "Harper Lee"
#
# book.publication_year
# #=> "1960"
