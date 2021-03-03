require 'rails_helper'

describe Tmdb do
  let(:tmdb) { Tmdb.new("fight").call }

  it "has the right keys", :vcr do
    expect(tmdb).to be_kind_of Hash
    expect(tmdb).to have_key :formatted_results
    expect(tmdb).to have_key :movie_amount
    expect(tmdb).to have_key :tv_amount
    expect(tmdb).to have_key :person_amount
    expect(tmdb).to have_key :multi_amount
  end
end
