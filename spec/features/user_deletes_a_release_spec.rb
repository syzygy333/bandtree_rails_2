require 'rails_helper'

feature 'user deletes a release', %Q{
  As a signed up user
  I want to delete a release
  So that I can make the tree better
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'deletes release information' do
    release = FactoryGirl.create(:release)

    visit release_path(release)
    click_link "Delete Release"

    expect(page).to have_content("Release deleted")
    expect(page).to_not have_content(release.title)
  end
end
