require 'rails_helper'

feature 'user views all bands', %Q{
  As a signed up user
  I want to edit a band's information
  So that I can make the tree better
} do

  scenario "guest tries to edit band" do
    band = FactoryGirl.create(:band)
    visit band_path(band.id)

    expect(page).not_to have_content("Edit Band")
    expect(page).to have_content(band.name)
  end

  scenario "non-admin tries to edit band" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)
    visit band_path(band.id)

    expect(page).not_to have_content("Edit Band")
    expect(page).to have_content(band.name)
  end

  scenario "admin edits band with valid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)
    visit band_path(band.id)

    click_link "Edit Band"

    expect(page).to have_content("Edit Band")
    expect(page).to have_content("Private")

    fill_in "Name", with: "The Sea and Cake"

    click_button "Accept"

    expect(page).to have_content("Band updated")
    expect(page).to_not have_content(band.name)
    expect(page).to have_content("The Sea and Cake")
  end

  scenario "admin edits band with invalid information" do
    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    band = FactoryGirl.create(:band)
    visit band_path(band.id)

    click_link "Edit Band"

    expect(page).to have_content("Edit Band")
    expect(page).to have_content("Private")

    fill_in "Name", with: ""

    click_button "Accept"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Edit Band")
    expect(page).to have_content("Private")
  end
end
