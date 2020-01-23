require 'rspec'
require 'capybara/rspec'
require 'pry'

Capybara.current_driver = :selenium
Capybara.app_host = "https://still-earth-30296.herokuapp.com"

RSpec.describe "Home page" do
  it "can visit the home page" do
    Capybara.visit "/"

    expect(Capybara.page).to have_content("Adopt Don't Shop")
  end

end
