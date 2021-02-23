require 'rails_helper'

describe Tmdb do
  let(:tmdb) { Tmdb.new("fight") }

  it "returns correct language" do
    expect(tmdb.language).to be_eql("language=pt-BR")
  end

  it "returns correct endpoint" do
    expect(tmdb.api_endpoint).to be_eql("https://api.themoviedb.org/3/search")
  end
end
