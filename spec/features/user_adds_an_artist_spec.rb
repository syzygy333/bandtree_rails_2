require "rails_helper"

feature "user adds an artist", %{
  As a signed up user
  I want to add an artist
  So that I can grow the bandtree
} do

  scenario "guest inputs valid information" do
    visit new_artist_path
    artist = FactoryGirl.create(:artist)
    fill_in "First name", with: artist.first_name
    fill_in "Last name", with: artist.last_name
    fill_in "Biography", with: artist.biography
    fill_in "Official link", with: artist.official_link

    click_button "Add Artist"

    expect(page).to have_content("You must be signed in")
    expect(page).to have_content("Add an artist")
    expect(page).to have_content(artist.biography)
  end

  scenario "non-admin inputs valid information" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    visit new_artist_path
    artist = FactoryGirl.create(:artist)
    fill_in "First name", with: artist.first_name
    fill_in "Last name", with: artist.last_name
    fill_in "Biography", with: artist.biography
    fill_in "Official link", with: artist.official_link

    click_button "Add Artist"

    expect(page).to have_content("You must be an admin")
    expect(page).to have_content("Add an artist")
    expect(page).to have_content(artist.biography)
  end

  scenario "admin inputs valid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

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
    expect(page).to have_content("Edit Artist")
    expect(page).to have_content("Delete Artist")
  end

  scenario "admin inputs invalid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    visit new_artist_path
    artist = FactoryGirl.create(:artist)
    fill_in "Biography", with: artist.biography
    fill_in "Official link", with: artist.official_link
    fill_in "Wiki link", with: artist.wiki_link

    click_button "Add Artist"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Add an artist")
    expect(page).to have_content(artist.biography)
  end

  scenario "admin adds artist with photo" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    visit new_artist_path
    fill_in "First name", with: Faker::Name.first_name
    fill_in "Last name", with: Faker::Name.last_name
    fill_in "Biography", with: Faker::Lorem.paragraph(3)
    fill_in "Official link", with: Faker::Internet.url
    attach_file "Portrait", "#{Rails.root}/spec/support/images/example_photo.jpg"

    click_button "Add Artist"

    expect(page).to have_content("Artist added")
    expect(page).to have_content("Edit Artist")
    expect(page).to have_content("Delete Artist")
    expect(Artist.first.portrait.file.filename).to eq("example_photo.jpg")

  end
end
