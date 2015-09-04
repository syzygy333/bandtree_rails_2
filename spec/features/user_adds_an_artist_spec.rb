require "rails_helper"

feature "user adds an artist", %{
  As a signed up user
  I want to add an artist
  So that I can grow the bandtree
} do
  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario "valid information in form to add an artist" do
    visit new_artist_path
    artist = FactoryGirl.create(:artist)
    fill_in "First name", with: artist.first_name
    fill_in "Last name", with: artist.last_name
    fill_in "Biography", with: artist.biography
    fill_in "Official link", with: artist.official_link

    click_button "Add Artist"

    expect(page).to have_content("Artist added")
    expect(page).to have_content(artist.first_name)
    expect(page).to have_content(artist.last_name)
    expect(page).to have_content(artist.biography)
  end

  scenario "invalid information in form to add a band" do
    visit new_artist_path
    artist = FactoryGirl.create(:artist)
    fill_in "Biography", with: artist.biography
    fill_in "Official link", with: artist.official_link
    fill_in "Wiki link", with: artist.wiki_link

    click_button "Add Artist"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content(artist.biography)
  end
end
