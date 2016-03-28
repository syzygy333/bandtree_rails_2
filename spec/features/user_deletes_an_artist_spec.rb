require "rails_helper"

feature "user deletes an artist", %{
  As a signed up user
  I want to delete an artist
  So that I can make the tree better
} do

  scenario "guest tries to delete artist" do
    artist = FactoryGirl.create(:artist)

    visit artist_path(artist)

    expect(page).not_to have_content("Delete Artist")
    expect(page).to have_content(artist.first_name)
    expect(page).to have_content(artist.last_name)
    expect(page).to have_content(artist.biography)
  end

  scenario "non-admin deletes artist" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    artist = FactoryGirl.create(:artist)

    visit artist_path(artist)

    expect(page).not_to have_content("Delete Artist")
    expect(page).to have_content(artist.first_name)
    expect(page).to have_content(artist.last_name)
    expect(page).to have_content(artist.biography)
  end

  scenario "admin deletes artist" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    artist = FactoryGirl.create(:artist)

    visit artist_path(artist)
    click_link "Delete Artist"

    expect(page).to have_content("Artist deleted")
    expect(page).to have_content("Artists")
    expect(page).to_not have_content(artist.first_name)
    expect(page).to_not have_content(artist.last_name)
    expect(page).to_not have_content(artist.biography)
  end
end
