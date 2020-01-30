require 'rspec'
require 'capybara/rspec'
require 'pry'

HOSTNAME = "https://still-earth-30296.herokuapp.com"
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome