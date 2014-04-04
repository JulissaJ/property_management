require 'spec_helper'

feature 'real estate associate adds a new building owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationship with owners
} do

# Acceptance Criteria:

# I must specify a first name, last name, and email address
# I can optionally specify a company name
# If I do not specify the required information, I am presented with errors
# If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'successfully adds a building owner' do
    prev_count = Owner.count
    visit new_owner_path
    fill_in 'First Name', with: 'Julissa'
    fill_in 'Last Name', with: 'Jansen'
    fill_in 'Email', with: 'julissa.jansen@gmail.com'
    fill_in 'Company', with: 'Launch Academy'

    click_on 'Add Owner'

    expect(page).to have_content 'Owner was successfully added'
    expect(Owner.count).to eq(prev_count +1)
  end

  scenario 'invalid owner' do
    visit new_owner_path

    click_on 'Add Owner'
    expect(page).to have_content 'can\'t be blank'
  end

  scenario 'invalid email' do
    visit new_owner_path
    fill_in 'First Name', with: 'Julissa'
    fill_in 'Last Name', with: 'Jansen'
    fill_in 'Email', with: 'julissa.jansen@gmail'
    fill_in 'Company', with: 'Launch Academy'

    click_on 'Add Owner'

    expect(page).to have_content 'is invalid'
  end

end




















#     scenario 'Invalid building' do
#       visit new_building_path

#       click_on 'Add Building'
#       expect(page).to have_content 'can\'t be blank'


#   end

# end
