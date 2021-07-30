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

    it "returns an array of currently checked out books" do
      expect(dpl.checked_out_books).to eq([jane_eyre])
    end

    it "changes a book to be no longer checked out" do
      expect(dpl.checkout(jane_eyre)).to be(false)
      dpl.return(jane_eyre)
      expect(dpl.checked_out_books).to eq([])
      expect(dpl.checkout(jane_eyre)).to be(true)
      expect(dpl.checkout(villette)).to be(true)
      expect(dpl.checked_out_books).to eq([jane_eyre, villette])
    end

    it "tracks the most checked out book" do
      expect(dpl.checkout(mockingbird)).to be(true)
      dpl.return(mockingbird)
      expect(dpl.checkout(mockingbird)).to be(true)
      dpl.return(mockingbird)
      expect(dpl.checkout(mockingbird)).to be(true)
      expect(dpl.most_popular_book).to eq(mockingbird)
    end
  end
end
