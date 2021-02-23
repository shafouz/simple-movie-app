require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        name: "Name"
      ),
      Movie.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
