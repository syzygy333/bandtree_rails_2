require 'rails_helper'

feature 'user deletes a band', %Q{
  As a signed up user
  I want to delete a band
  So that I can keep the tree free of mistakes
} do

  scenario "guest tries to delete band" do
    band = FactoryGirl.create(:band)
    visit band_path(band.id)
    expect(page).to have_content(band.name)

    expect(page).not_to have_content("Delete Band")
    expect(page).to have_content(band.name)
  end

  scenario "non-admin tries to delete band" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)
    visit band_path(band.id)
    expect(page).to have_content(band.name)

    expect(page).not_to have_content("Delete Band")
    expect(page).to have_content(band.name)
  end

  scenario "admin deletes band" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)
    visit band_path(band.id)
    expect(page).to have_content(band.name)

    click_link "Delete Band"

    expect(page).to_not have_content(band.name)
    expect(page).to have_content("Band deleted")
    expect(page).to have_content("Bands")
  end
end
