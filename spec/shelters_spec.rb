require 'spec_helper'

RSpec.describe "Shelters", type: :feature do
  before(:each) do
    Capybara.current_driver = :selenium
    Capybara.app_host = HOSTNAME
  end


  it "(2) sees names of all shelters on the shelter index page" do
    visit "/shelters"

    expect(page).to have_content("Mike's Shelter")
    expect(page).to have_content("Meg's Shelter")
  end

  it "(3) shelter show page " do
    visit "/shelters/1"

    expect(page).to have_content("Mike's Shelter")
    expect(page).to have_content("1331 17th Street")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80202")

    expect(page).to_not have_content("Meg's Shelter")
    expect(page).to_not have_content("150 Main Street")
    expect(page).to_not have_content("Hershey")
    expect(page).to_not have_content("PA")
    expect(page).to_not have_content("17033")
  end

  it "(4) can create a shelter" do
    visit "/shelters"

    click_on "New Shelter"
    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Cats are Useless"
    fill_in :address, with: "123 Some Street"
    fill_in :city, with: "Beverly Hills"
    fill_in :state, with: "CA"
    fill_in :zip, with: "90210"
    click_on "Create Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('Cats are Useless')
  end

  it "(5) can update a shelter" do
    visit "/shelters/2"

    click_on "Update Shelter"
    expect(current_path).to eq('/shelters/2/edit')

    fill_in :name, with: "Puppers Central"
    fill_in :address, with: "57 Doggo Lane"
    fill_in :city, with: "Jersey City"
    fill_in :state, with: "NJ"
    fill_in :zip, with: "07305"
    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/2")
    expect(page).to have_content("57 Doggo Lane")
    expect(page).to have_content("Jersey City")
    expect(page).to have_content("NJ")
    expect(page).to have_content("07305")

    expect(page).to_not have_content("150 Main Street")
    expect(page).to_not have_content("Hershey")
    expect(page).to_not have_content("PA")
    expect(page).to_not have_content("17033")
  end

  xit "(6) can delete a shelter" do
    visit "/shelters/1"

    click_on "Delete Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Mike's Shelter")
  end
end
