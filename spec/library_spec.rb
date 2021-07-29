require './lib/book'
require './lib/author'


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

    xit "can add authors" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])

    end

    xit "can tell an author's publication time frame" do
      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end
end
