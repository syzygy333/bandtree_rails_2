require 'rails_helper'

feature 'user adds a band', %Q{
  As a signed up user
  I want to add a band
  So that I can grow the bandtree
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'valid information in form to add a band' do
    visit new_band_path
    band = FactoryGirl.create(:band)
    fill_in "Name", with: band.name
    fill_in "Biography", with: band.biography
    fill_in "Official link", with: band.official_link
    fill_in "Wiki link", with: band.wiki_link

    click_button "Add"

    expect(page).to have_content("Band added")
  end

  scenario 'invalid information in form to add a band' do
    visit new_band_path
    band = FactoryGirl.create(:band)
    fill_in "Biography", with: band.biography
    fill_in "Official link", with: band.official_link
    fill_in "Wiki link", with: band.wiki_link

    click_button "Add"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content(band.biography)
  end
end
