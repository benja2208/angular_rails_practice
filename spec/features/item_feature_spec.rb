require 'rails_helper'

feature 'items' do
  context 'no items have been added' do
    scenario 'should display a prompt to add an item' do
      visit '/items'
      expect(page).to have_content 'No items yet'
      expect(page).to have_link 'Add an item'
    end
  end

  context 'adding items' do
  	scenario 'User can add a photo with a description, a price and a store' do
  		visit '/items'
  		click_link 'Add an item'
      allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/photo.png")
  		fill_in 'Description', with: 'my first photo'
  		fill_in 'Price', with: '12'
  		select 'Zara', from: 'Store'
  		click_button 'Add item'
  		expect(current_path).to eq('/items')
  		expect(page).to have_css ('img[src*="photo.png"]')
  		expect(page).to have_content 'my first photo'
  		expect(page).to have_content '£12.00'
  		expect(page).to have_content 'Zara'
  	end
  end

  context 'liking items' do
    xscenario 'user can like an item', js: true do
      user = build :user
      sign_up(user)
      upload_photo
      visit '/items'
      click_link 'like'
      expect(page).to have_content('1 like')
    end
  end
end