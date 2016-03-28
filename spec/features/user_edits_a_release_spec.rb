require "rails_helper"

feature "user edits a release", %{
  As a signed up user
  I want to edit a release
  So that I can make the tree better
} do

  scenario "guest edits release" do
    release = FactoryGirl.create(:release)

    visit release_path(release)

    expect(page).not_to have_content("Edit Release")
    expect(page).to have_content(release.title)
  end

  scenario "non-admin edits release" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)

    visit release_path(release)

    expect(page).not_to have_content("Edit Release")
    expect(page).to have_content(release.title)
  end

  scenario "admin edits release with valid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)

    visit release_path(release)
    click_link "Edit Release"

    fill_in "Title", with: Faker::Lorem.sentence(2)
    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 50
    choose("Record")
    choose("EP")

    click_button "Accept"

    expect(page).to have_content("Release updated")
    expect(page).to have_content(50)
    expect(page).to have_content("Edit Release")
    expect(page).to have_content("Delete Release")
  end

  scenario "admin edits release with invalid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)

    visit release_path(release)
    click_link "Edit Release"

    fill_in "Title", with: ""
    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 50
    choose("Record")
    choose("EP")

    click_button "Accept"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Edit release")
    expect(page).to have_content("7-inch")
  end
end
