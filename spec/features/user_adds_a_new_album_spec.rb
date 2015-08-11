require 'rails_helper'

feature 'user adds an album', %Q{
  As a signed up user
  I want to add an album
  So that I can grow the bandtree
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    band = FactoryGirl.create(:band)
    release = FactoryGirl.create(:release)
  end

  scenario 'valid information in form to add an album' do
    visit band_path(band)
    click_link "Add Release"

    fill_in "Title", with: album.title
    fill_in "Track list", with: album.track_list
    fill_in "Year released", with: album.year_released
    fill_in "Record label", with: album.record_label
    fill_in "Record label url", with: album.record_label_url
    fill_in "Catalog number", with: album.catalog_number
    fill_in "Type", with: album.type
    fill_in "Length", with: album.length

    click_button "Add Album"

    expect(page).to have_content("Album added")
    expect(page).to have_content(band.name)
  end

  scenario 'invalid information in form to add a band' do
    visit new_band_path

    click_button "Add Album"

    expect(page).to have_content()
    expect(page).to have_content()
  end
end
