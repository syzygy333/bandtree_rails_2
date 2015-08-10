require 'rails_helper'

feature 'user views all bands', %Q{
  As a signed up user
  I want to edit a band's information
  So that I can make the tree better
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'edits band information' do
    band = FactoryGirl.create(:band)
    visit band_path(band.id)

    click_link "Edit Band"

    expect(page).to have_content("Edit Band")
    expect(page).to have_content("Private")

    fill_in "Name", with: "The Sea and Cake"

    click_button "Accept"

    expect(page).to have_content("Band updated")
    expect(page).to have_content("The Sea and Cake")
  end
end
