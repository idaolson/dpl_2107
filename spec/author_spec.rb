require './lib/book'
require './lib/author'


RSpec.describe Author do
  context "it's an author" do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    it "exists" do
      expect(charlotte_bronte).to be_an(Author)
    end

    it "can have a full name" do
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it "can write books" do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre).to be_a(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
    end
  end
end
