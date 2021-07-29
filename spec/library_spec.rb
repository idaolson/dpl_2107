require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  context "it's a library" do
    dpl = Library.new("Denver Public Library")

    it "exists" do
      expect(dpl).to be_a(Library)
    end

    it "has attributes" do
      expect(dpl.name).to eq("Denver Public Library")
    end

    it "can store books and authors in an array" do
      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end

  end

  context "library has methods" do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    it "can add authors" do
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end

    it "can tell an author's publication time frame" do
      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  context "library can circulate" do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    it "checks out books if they exist" do
      expect(dpl.checkout(mockingbird)).to be(false)
      expect(dpl.checkout(jane_eyre)).to be(false)
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      expect(dpl.checkout(jane_eyre)).to be(true)
    end
  end
end

# Ran out of time :(


# The `checked_out_books` method should return an array
# of books that are currently checked out.
#
# The `return` method takes a `Book` as an argument.
# Calling this method means that a book is no longer
# checked out.
#
# The `most_popular_book` method should return the book
# that has been checked out the most.

# dpl.checked_out_books
# #=> [#<Book:0x00007f8c01433138...>]
#
# # This book cannot be checked out because it is currently checked out
# dpl.checkout(jane_eyre)
# #=> false
#
# dpl.return(jane_eyre)
#
# # Returning a book means it should no longer be checked out
# dpl.checked_out_books
# #=> []
#
# dpl.checkout(jane_eyre)
# #=> true
#
# dpl.checkout(villette)
# #=> true
#
# dpl.checked_out_books
# #=> [#<Book:0x00007f8c01433138...>, #<Book:0x00007f8c021d84c8...>]
#
# dpl.checkout(mockingbird)
# #=> true
#
# dpl.return(mockingbird)
#
# dpl.checkout(mockingbird)
# #=> true
#
# dpl.return(mockingbird)
#
# dpl.checkout(mockingbird)
# #=> true
#
# dpl.most_popular_book
# #=> #<Book:0x00007f8c019506c0...>
# ```
