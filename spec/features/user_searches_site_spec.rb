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

  scenario "searches the database" do
    artist = FactoryGirl.create(:artist)
    band = FactoryGirl.create(:band)
    release = FactoryGirl.create(:release)

    visit "/results?utf8=%E2%9C%93&query=#{artist.first_name}"

    expect(page).to have_content("Search Results")
    expect(page).to have_content(artist.full_name)

    visit "/results?utf8=%E2%9C%93&query=#{artist.middle_name}"

    expect(page).to have_content("Search Results")
    expect(page).to have_content(artist.full_name)

    visit "/results?utf8=%E2%9C%93&query=#{artist.last_name}"

    expect(page).to have_content("Search Results")
    expect(page).to have_content(artist.full_name)

    visit "/results?utf8=%E2%9C%93&query=#{band.name}"

    expect(page).to have_content("Search Results")
    expect(page).to have_link(band.name)

    visit "/results?utf8=%E2%9C%93&query=#{release.title}"

    expect(page).to have_content("Search Results")
    expect(page).to have_content(release.title)
  end
end
