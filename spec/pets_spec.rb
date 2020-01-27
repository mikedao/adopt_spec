require 'spec_helper'

RSpec.describe "Pets", type: :feature do
  before(:each) do
    Capybara.current_driver = :selenium
    Capybara.app_host = HOSTNAME
  end

  it "(7) pets index" do
    visit "/pets"
    expect(page).to have_content("Name: Athena")
    expect(page).to have_content("Age: 1")
    expect(page).to have_content("Sex: F")
    expect(page).to have_content("Shelter: Mike's Shelter")

    expect(page).to have_content("Name: Odell")
    expect(page).to have_content("Age: 4")
    expect(page).to have_content("Sex: M")
    expect(page).to have_content("Shelter: Meg's Shelter")
  end

  it "(8) Shelter pets index" do
    visit "/shelters/1/pets"
    expect(page).to have_content("Name: Athena")
    expect(page).to have_content("Age: 1")
    expect(page).to have_content("Sex: F")

    expect(page).to_not have_content("Name: Odell")
    expect(page).to_not have_content("Age: 7")
    expect(page).to_not have_content("Sex: M")
  end

  it "(9) Pets show page" do
    visit "/pets/1"
    expect(page).to have_content("Name: Athena")
    expect(page).to have_content("Age: 1")
    expect(page).to have_content("Sex: F")
    expect(page).to have_content("Description: Butthead")
    expect(page).to have_content("Status: Adoptable")

    expect(page).to_not have_content("Name: Odell")
    expect(page).to_not have_content("Age: 7")
    expect(page).to_not have_content("Sex: M")
  end
  
  it "(10) Shelter pets creation" do
    visit "/shelters/2/pets"

    click_on "Create Pet"

    fill_in :image, with: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1094874726.png?crop=0.542xw:0.814xh;0.0472xw,0.127xh&resize=640:*"
    fill_in :name, with: "Phoebe"
    fill_in :description, with: "Good girl"
    fill_in :age, with: "14"
    fill_in :sex, with: "female"
    click_on "Create Pet"

    expect(current_path).to eq("/shelters/2/pets")

    expect(page).to have_content("Name: Phoebe")
    expect(page).to have_content("Age: 14")
    expect(page).to have_content("Sex: F")
    expect(page).to have_content("Description: Good girl")
    expect(page).to have_content("Status: Adoptable")
  end

  it "(11) pet update" do
    visit "/pets/2" 
    click_on "Update Pet"

    expect(current_path).to eq("/pets/2/edit")
    fill_in :image, with: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1094874726.png?crop=0.542xw:0.814xh;0.0472xw,0.127xh&resize=640:*"
    fill_in :name, with: "Sodie"
    fill_in :description, with: "Small girl"
    fill_in :age, with: "6"
    fill_in :sex, with: "female"
    click_on "Update Pet"

    expect(current_path).to eq("/pets/2")
    
    expect(page).to have_content("Sodie")
    expect(page).to have_content("Small girl")
    expect(page).to have_content("6")

    expect(page).to_not have_content("Name: Phoebe")
    expect(page).to_not have_content("Age: 14")
    expect(page).to_not have_content("Description: Good girl")
    expect(page).to_not have_content("Status: Adoptable")
  end

  it "(12) Pet Delete" do
    visit "/pets/1"
    click_on "Delete Pet"
    
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Athena")
  end
end

