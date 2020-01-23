require 'rspec'
require 'capybara/rspec'
require 'pry'

Capybara.current_driver = :selenium
Capybara.app_host = "https://still-earth-30296.herokuapp.com"

RSpec.describe "Adopt Don't Shop" do
  context "shelters" do
    it "(2) sees names of all shelters on the shelter index page" do
      Capybara.visit "/shelters"

      expect(Capybara.page).to have_content("Mike's Shelter")
      expect(Capybara.page).to have_content("Meg's Shelter")
    end

    it "(3) shelter show page " do
      Capybara.visit "/shelters/1"

      expect(Capybara.page).to have_content("Mike's Shelter")
      expect(Capybara.page).to have_content("1331 17th Street")
      expect(Capybara.page).to have_content("Denver")
      expect(Capybara.page).to have_content("CO")
      expect(Capybara.page).to have_content("80202")

      expect(Capybara.page).to_not have_content("Meg's Shelter")
      expect(Capybara.page).to_not have_content("150 Main Street")
      expect(Capybara.page).to_not have_content("Hershey")
      expect(Capybara.page).to_not have_content("PA")
      expect(Capybara.page).to_not have_content("17033")
    end

    it "(4) can create a shelter" do
      Capybara.visit "/shelters"

      Capybara.click_on "New Shelter"
      expect(Capybara.current_path).to eq('/shelters/new')

      Capybara.fill_in :name, with: "Cats are Useless"
      Capybara.fill_in :address, with: "123 Some Street"
      Capybara. fill_in :city, with: "Beverly Hills"
      Capybara.fill_in :state, with: "CA"
      Capybara.fill_in :zip, with: "90210"
      Capybara.click_on "Create Shelter"

      expect(Capybara.current_path).to eq('/shelters')
      expect(Capybara.page).to have_content('Cats are Useless')
    end
  end

end
