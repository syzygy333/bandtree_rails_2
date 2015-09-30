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

  scenario "links artist to release" do
    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)
    within("#link") do
      select(artist.full_name, from: "20 most recent artists")
    end
    click_button "Link artist"

    within("#unlink") do
      select(artist.full_name, from: "Connected artists")
    end
    click_button "Unlink artist"

    expect(page).to have_content("Release updated")
    expect(page).to have_content("Performing Artists")
    expect(page).to_not have_link("#{artist.full_name}")
  end
end
