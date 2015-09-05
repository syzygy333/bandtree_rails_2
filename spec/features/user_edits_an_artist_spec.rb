require "rails_helper"

feature "user edits an artist", %Q{
  As a signed up user
  I want to edit an artist
  So that I can make the tree better
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario "edits artist information" do
    artist = FactoryGirl.create(:artist)
    link = artist.official_link
    bio = artist.biography

    visit artist_path(artist)
    click_link "Edit Artist"

    fill_in "Biography", with: Faker::Lorem.sentence(2)
    fill_in "Stage name", with: Faker::Name.first_name
    fill_in "Official link", with: Faker::Internet.url
    fill_in "Wiki link", with: Faker::Internet.url

    click_button "Accept"

    expect(page).to have_content("Artist updated")
    expect(page).to_not have_content(link)
    expect(page).to_not have_content(bio)
  end
end
