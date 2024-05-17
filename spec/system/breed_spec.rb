require 'rails_helper'

RSpec.describe 'Breed search', type: :system do
  before do
    driven_by(:selenium_chrome_headless) # Use headless mode for CI environments
  end

  it 'allows a user to search for a breed and see the image' do
    visit root_path

    # Fill in the breed input and submit the form
    fill_in 'Breed', with: 'shihtzu'
    click_button 'search-button'

    # Expect to see the image
    expect(page).to have_selector('img[src*="https://images.dog.ceo/breeds/shihtzu/"]')
  end

  it 'displays an error message for invalid breed input' do
    visit root_path

    # Fill in the breed input with invalid data and submit the form
    fill_in 'Breed', with: 'invalid_breed123'
    click_button 'search-button'

    # Expect to see the error message
    expect(page).to have_content('Please Change. Only english alphabets are allowed (letters only & no spaces).')
  end
end