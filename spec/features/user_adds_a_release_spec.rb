require 'rails_helper'

feature 'user adds a release', %Q{
  As a signed up user
  I want to add a release
  So that I can grow the bandtree
} do

  scenario "guest inputs valid information" do
    band = FactoryGirl.create(:band)

    visit band_path(band)

    expect(page).not_to have_content("Add Release")
  end

  scenario "non-admin inputs valid information" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)

    visit band_path(band)

    expect(page).not_to have_content("Add Release")
  end

  scenario "admin inputs valid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)

    visit band_path(band)
    click_link "Add Release"

    fill_in "Title", with: Faker::Lorem.sentence(2)
    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 50
    choose("CD")
    choose("LP")

    click_button "Add Release"

    expect(page).to have_content("Release added")
    expect(page).to have_content(band.name)
    expect(page).to have_content("Edit Release")
    expect(page).to have_content("Delete Release")
    expect(page).to have_content(50)
  end

  scenario "admin inputs invalid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)

    visit band_path(band)
    click_link "Add Release"

    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 55
    choose("CD")
    choose("LP")

    click_button "Add Release"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Add a release")
    expect(page).to have_content("55")
  end

  scenario "admin adds release with photo" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)

    visit band_path(band)
    click_link "Add Release"

    fill_in "Title", with: Faker::Lorem.sentence(2)
    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 50
    choose("CD")
    choose("LP")
    attach_file "Release Art", "#{Rails.root}/spec/support/images/example_photo.jpg"

    click_button "Add Release"

    expect(page).to have_content("Release added")
    expect(page).to have_content("Edit Release")
    expect(page).to have_content("Delete Release")
    expect(Release.first.release_art.file.filename).to eq("example_photo.jpg")
  end
end
