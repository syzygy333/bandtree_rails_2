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

  scenario 'valid information in form to add a release' do
    band = FactoryGirl.create(:band)

    visit band_path(band)
    click_link "Add Release"

    fill_in "Title", with: Faker::Lorem.sentence(2)
    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 50
    fill_in "Release type", with: "CD"
    fill_in "Release length", with: "LP"

    click_button "Add Release"

    expect(page).to have_content("Release added")
    expect(page).to have_content(band.name)
    expect(page).to have_content(50)
  end

  scenario 'invalid information in form to add a release' do
    band = FactoryGirl.create(:band)

    visit band_path(band)
    click_link "Add Release"

    fill_in "Track list", with: Faker::Lorem.sentence(2)
    fill_in "Record label", with: Faker::Lorem.sentence(1)
    fill_in "Record label url", with: Faker::Internet.url
    fill_in "Catalog number", with: 55
    fill_in "Release type", with: "CD"
    fill_in "Release length", with: "LP"

    click_button "Add Release"

    expect(page).to have_content("Add a release")
    expect(page).to have_content("Private")
  end
end
