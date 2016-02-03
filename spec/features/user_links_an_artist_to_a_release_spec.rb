require "rails_helper"

feature "user links an artist to a release", %{
  As a signed up user
  I want to link an artist to a release
  So that I can make the tree better
} do

  scenario "guest links artist to release" do
    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)

    within("#link") do
      select(artist.full_name, from: "All artists")
    end
    click_button "Link artist"

    expect(page).to have_content("You must be an admin")
    expect(page).to have_content("artists involved")
    expect(page).to_not have_link("#{artist.full_name}")
  end

  scenario "non-admin links artist to release" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)

    within("#link") do
      select(artist.full_name, from: "All artists")
    end
    click_button "Link artist"

    expect(page).to have_content("You must be an admin")
    expect(page).to have_content("artists involved")
    expect(page).to_not have_link("#{artist.full_name}")
  end

  scenario "admin links artist to release" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)
    within("#link") do
      select(artist.full_name, from: "All artists")
    end
    click_button "Link artist"

    expect(page).to have_content("Release updated")
    expect(page).to have_content("artists involved")
    expect(page).to have_link("#{artist.full_name}")
  end
end
