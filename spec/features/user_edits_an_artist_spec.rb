require "rails_helper"

feature "user edits an artist", %{
  As a signed up user
  I want to edit an artist
  So that I can make the tree better
} do

  scenario "guest edits artist" do
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

    expect(page).to have_content("You must be an admin")
    expect(page).to have_content(artist.full_name)
    expect(page).to have_content(link)
    expect(page).to have_content(bio)
    expect(page).to have_content("Edit Artist")
    expect(page).to have_content("Delete Artist")
  end

  scenario "non-admin edits artist" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

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

    expect(page).to have_content("You must be an admin")
    expect(page).to have_content(artist.full_name)
    expect(page).to have_content(link)
    expect(page).to have_content(bio)
    expect(page).to have_content("Edit Artist")
    expect(page).to have_content("Delete Artist")
  end

  scenario "admin edits artist with valid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

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

  scenario "admin edits artist with invalid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    artist = FactoryGirl.create(:artist)
    link = artist.official_link
    bio = artist.biography

    visit artist_path(artist)
    click_link "Edit Artist"

    fill_in "First name", with: ""
    fill_in "Biography", with: Faker::Lorem.sentence(2)
    fill_in "Stage name", with: Faker::Name.first_name
    fill_in "Official link", with: Faker::Internet.url
    fill_in "Wiki link", with: Faker::Internet.url

    click_button "Accept"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Portrait")
    expect(page).to_not have_content(bio)
    expect(page).to_not have_content(link)
  end
end
