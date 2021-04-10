require 'rails_helper'

describe Displayer do
  let(:json_input) { Displayer.response_handler(Tmdb.new("Avengers").call)  }
  let(:active_record_input) { Displayer.response_handler(Medium.multi_search("Avengers")) }

  it "has right keys for json response", :vcr do
    expect(json_input).to be_kind_of Hash
    expect(json_input).to have_key "movies"
    expect(json_input).to have_key "tvs"
    expect(json_input).to have_key "people"
    expect(json_input).to have_key "movie_amount"
    expect(json_input).to have_key "tv_amount"
    expect(json_input).to have_key "person_amount"
    expect(json_input).to have_key "multi_amount"
  end

  it "has the right keys for active_record_input" do
    Medium.create(name: "Avengers")
    expect(active_record_input).to be_kind_of Hash
    expect(active_record_input).to have_key "movies"
    expect(active_record_input).to have_key "tvs"
    expect(active_record_input).to have_key "people"
    expect(active_record_input).to have_key "movie_amount"
    expect(active_record_input).to have_key "tv_amount"
    expect(active_record_input).to have_key "person_amount"
    expect(active_record_input).to have_key "multi_amount"
  end
  
end
