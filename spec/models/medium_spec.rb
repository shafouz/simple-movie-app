require 'rails_helper'

RSpec.describe Medium, type: :model do
  let!(:movie) { create(:movie) }
  let!(:tv) { create(:tv) }
  let!(:person) { create(:person) }

  describe "all searches" do
    it "finds when uppercase" do
      res = Medium.multi_search("DEAR")
      expect(res[0]).to have_attributes(:name => "Querido John")
    end

    it "finds when lowercase" do
      res = Medium.multi_search("dear")
      expect(res[0]).to have_attributes(:name => "Querido John")
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

  describe "validations" do

    describe "movie validations" do
      let(:movie) { create(:movie) }
      let(:movie2) { attributes_for(:movie, release_date: "test") }
      let(:movie3) { attributes_for(:movie) }

      it "saves with same original_title but different release_date" do
        expect(Medium.new(movie2)).to be_valid
      end

      it "doesnt save with same original_title and same release_date" do
        expect(Medium.new(movie3)).not_to be_valid
      end
    end

    describe "tv validations" do
      let(:tv) { create(:tv) }
      let(:tv2) { attributes_for(:tv, first_air_date: "test") }
      let(:tv3) { attributes_for(:tv) }

      it "saves with same original_name but different first_air_date" do
        expect(Medium.new(tv2)).to be_valid
      end

      it "doesnt save with same original_name and same first_air_date" do
        expect(Medium.new(tv3)).not_to be_valid
      end
    end
  end
end
