require 'rails_helper'

RSpec.describe Medium, type: :model do
  let!(:movie) { create(:movie) }
  let!(:tv) { create(:tv) }
  let!(:person) { create(:person) }

  describe "all searches" do
    it "finds when uppercase" do
      res = Medium.multi_search("DEAR")
      expect(res[0]).to have_attributes(name: "Querido John")
    end

    it "finds when lowercase" do
      res = Medium.multi_search("dear")
      expect(res[0]).to have_attributes(name: "Querido John")
    end
  end

  describe "multi_search" do
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
  end

  describe "movie_search" do
    result = Medium.movie_search("John")

    it "finds only movie media type" do
      expect(result.pluck(:media_type)).to include("movie")
      expect(result.pluck(:media_type)).to_not include("tv")
      expect(result.pluck(:media_type)).to_not include("person")
    end
  end

  describe "tv_search" do
    result = Medium.tv_search("John")

    it "finds only tv media type" do
      expect(result.pluck(:media_type)).to include("tv")
      expect(result.pluck(:media_type)).to_not include("movie")
      expect(result.pluck(:media_type)).to_not include("person")
    end
  end

  describe "person_search" do
    result = Medium.person_search("John")

    it "finds only person media type" do
      expect(result.pluck(:media_type)).to include("person")
      expect(result.pluck(:media_type)).to_not include("movie")
      expect(result.pluck(:media_type)).to_not include("tv")
    end
  end
end
