require 'rails_helper'

feature 'user views all bands', %Q{
  As a signed up user
  I want to see all the bands
  So that I can browse the tree
} do

  scenario 'views bands index page' do
    band = FactoryGirl.create(:band)
    band2 = FactoryGirl.create(:band)
    visit bands_path

    expect(page).to have_content(band.name)
    expect(page).to have_content(band2.name)
  end
end
