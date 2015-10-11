require 'rails_helper'

feature 'commenting' do

  before(:each) do
    # user = build :user
    # sign_up(user)
    upload_photo
    visit '/items'
  end

  scenario 'allows users to leave a comment using a form' do
    fill_in 'Add a comment...', with: "Great photo"
    click_button 'Leave Comment'
    expect(page).to have_content('Great photo')
  end

  # xscenario 'reviews can be deleted if current user created them' do
  #   click_link 'Delete comment'
  #   expect(page).not_to have_content 'Excellent tomato'
  # end

  # xscenario 'reviews cannot be deleted if current user did not create them' do
  #   user_2 = build :user_2
  #   visit '/'
  #   click_link 'Sign out'
  #   sign_up(user_2)
  #   visit '/photos'
  #   expect(page).not_to have_content 'Delete'
  # end


end