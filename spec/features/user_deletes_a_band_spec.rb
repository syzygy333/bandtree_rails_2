require 'rails_helper'

feature 'user deletes a band', %Q{
  As a signed up user
  I want to delete a band
  So that I can keep the tree free of mistakes
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'deletes a band' do
    band = FactoryGirl.create(:band)
    visit band_path(band.id)
    expect(page).to have_content(band.name)

    click_link "Delete Band"

    expect(page).to_not have_content(band.name)
    expect(page).to have_content("Band deleted")
  end
end
