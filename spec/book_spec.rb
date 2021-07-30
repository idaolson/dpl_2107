require './lib/book'

RSpec.describe Book do
  context "it's a book" do
    book = Book.new({ author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})

    it "exists" do
      expect(book).to be_a(Book)
    end

    it "has attributes" do
      expect(book.title).to eq("To Kill a Mockingbird")
    end

    it "it can get author's full name" do
      expect(book.author).to eq("Harper Lee")
    end

    it "can get publication year from date" do
      expect(book.publication_year).to eq("1960")
    end

    it "can check if checked out" do
      expect(book.checked_out?).to be (false)
    end

    it "changes book status to checked out" do
      book.check_out
      expect(book.checked_out?).to be(true)
    end

    it "changes book status to checked in" do
      book.check_in
      expect(book.checked_out?).to be(false)
    end
  end
end
