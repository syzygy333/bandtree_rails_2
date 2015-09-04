require 'rails_helper'

feature 'user edits a release', %Q{
  As a signed up user
  I want to edit a release
  So that I can make the tree better
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'edits release information' do
    release = FactoryGirl.create(:release)

    visit release_path(release)
    click_link "Edit Release"

    fill_in "Title", with: Faker::Lorem.sentence(2)
    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 50
    fill_in "Release type", with: "CD"
    fill_in "Release length", with: "LP"

    click_button "Edit Release"

    expect(page).to have_content("Release updated")
    expect(page).to have_content(50)
  end
end
