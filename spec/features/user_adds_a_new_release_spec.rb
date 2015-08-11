require 'rails_helper'

feature 'user adds a release', %Q{
  As a signed up user
  I want to add a release
  So that I can grow the bandtree
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'valid information in form to add an album' do
    band = FactoryGirl.create(:band)
    release = FactoryGirl.create(:release)

    visit band_path(band)
    click_link "Add Release"

    fill_in "Title", with: release.title
    fill_in "Track list", with: release.track_list
    fill_in "Year released", with: release.year_released
    fill_in "Record label", with: release.record_label
    fill_in "Record label url", with: release.record_label_url
    fill_in "Catalog number", with: release.catalog_number
    fill_in "Type", with: release.type
    fill_in "Length", with: release.length

    click_button "Add Release"

    expect(page).to have_content("Release added")
    expect(page).to have_content(band.name)
  end

  scenario 'invalid information in form to add a band' do
    band = FactoryGirl.create(:band)
    release = FactoryGirl.create(:release)

    visit band_path(band)
    click_link "Add Release"

    click_button "Add Release"

    expect(page).to have_content()
    expect(page).to have_content()
  end
end
