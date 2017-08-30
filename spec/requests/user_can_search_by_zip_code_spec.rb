require 'rails_helper'
#As a user
#When I visit "/"
#And I fill in the search form with 80203
#And I click "Locate"
#Then I should be on page "/search" with parameters visible in the url
#Then I should see a list of the 10 closest stations within 6 miles sorted by distance
#And the stations should be limited to Electric and Propane
#And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

RSpec.describe 'user can search by zipcode' do
  scenario "when filling in search form" do
    fuel_station = create(:fuel_station)
    binding.pry
    visit root_path

    expect(page.status_code).to eq (200)

    fill_in "q", with: "80203"
    click_on "Locate"

    expect(current_path).to eq search_path
    expect(page).to have_content(fuel_station.name)
    expect(page).to have_content(fuel_station.address)
    expect(page).to have_content(fuel_station.fuel_types)
    expect(page).to have_content(fuel_station.distance)
    expect(page).to have_content(fuel_station.access_time)
    expect(page).to have_css('.closest_stations', count: 10)
  end
end