require 'spec_helper'

feature 'real estate agent adds a new building', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do

#     Acceptance Criteria:

# I must specify a street address, city, state, and postal code
# Only US states can be specified
# I can optionally specify a description of the building
# If I enter all of the required information in the required format, the building is recorded.
# If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'successfully adds a building' do
    prev_count = Building.count
    visit new_building_path
    fill_in 'Street Address', with: '933 Essex Street'
    fill_in 'City', with: 'Lawrence'
    select 'MA', from: 'State'
    fill_in 'Zip Code', with: '01841'
    fill_in 'Description', with: 'Up-and-coming neighborhood.'

    click_on 'Add Building'

    expect(page).to have_content 'Building was successfully added'
    expect(LifeHack.count).to eq(prev_count + 1)
  end

    scenario 'Invalid building' do
      prev_count = Building.count
      visit new_building_path

      click_on 'Add Building'
      expect(LifeHack.count).to eq(prev_count)

  end

end
