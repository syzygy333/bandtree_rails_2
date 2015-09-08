require "rails_helper"

feature "user deletes an artist", %{
  As a signed up user
  I want to delete an artist
  So that I can make the tree better
} do
  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario "deletes artist information" do
    artist = FactoryGirl.create(:artist)

    visit artist_path(artist)
    click_link "Delete Artist"

    expect(page).to have_content("Artist deleted")
    expect(page).to_not have_content(artist.first_name)
    expect(page).to_not have_content(artist.last_name)
    expect(page).to_not have_content(artist.biography)
  end
end
