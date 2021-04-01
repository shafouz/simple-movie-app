require "rails_helper"

RSpec.describe "search", js: true, :type => :system do
  let!(:query) { "Avengers" }

  it "searches", :vcr do
    visit(root_path)
    fill_in("query", with: query)
    click_on("Search")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Avengers")
    expect(page).to have_selector(".person")
    expect(page).to have_selector(".tv")
    expect(page).to have_selector(".movie")
    expect(page).to have_selector(".results")
    first('.movie button').click
    expect(page).to have_selector(".modal")
    within(".modal .flex.h-96") do
      find("#closedialog", visible: :all).click
    end
    expect(page).to_not have_selector(".modal")
  end
end
