require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe "multi_search" do
    let!(:movie) { create(:movie) }
    let!(:tv) { create(:tv) }
    let!(:person) { create(:person) }

    result = Medium.multi_search("John")

    it "finds all media types" do
      expect(result.pluck(:media_type)).to include("movie")
      expect(result.pluck(:media_type)).to include("tv")
      expect(result.pluck(:media_type)).to include("person")
    end

    it "finds the record once by title or original_title" do
      res = Medium.multi_search("John")
      res1 = Medium.multi_search("volta")
      expect(res[0]).to eql(res1[0])
    end

    it "finds the record once by name or original_name" do
      res = Medium.multi_search("Querido")
      res1 = Medium.multi_search("Dear")
      expect(res[0]).to eql(res1[0])
    end

    it "finds when uppercase" do
      res = Medium.multi_search("DEAR")
      expect(res[0]).to have_attributes(name: "Querido John")
    end

    it "finds when lowercase" do
      res = Medium.multi_search("dear")
      expect(res[0]).to have_attributes(name: "Querido John")
    end
  end
end
