require "rails_helper"

feature "user links an artist to a release", %{
  As a signed up user
  I want to link an artist to a release
  So that I can make the tree better
} do
  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario "searches for an artist" do
    artist = FactoryGirl.create(:artist)

    fill_in("Artist, Band, Release", with: artist.first_name)
    click_button "Search"
    save_and_open_page

    expect(page).to have_content("Search Results")
    expect(page).to have_content("")
    expect(page).to_not have_link("")
  end
end
