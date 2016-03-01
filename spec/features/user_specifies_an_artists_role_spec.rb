require "rails_helper"

feature "user specifies an artists role on a release", %{
  As a signed up user
  I want to specify what contribution an artist made to a release
  So that I can make the tree better
} do

  scenario "guest specifies artists role" do
    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)


  end

  scenario "non-admin specifies artists role" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)


  end

  scenario "admin specifies artists role" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    release = FactoryGirl.create(:release)
    artist = FactoryGirl.create(:artist)

    visit release_path(release)

    
  end
end
