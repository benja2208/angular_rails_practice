require 'rails_helper'

feature 'items' do
  context 'no items have been added' do
    scenario 'should display a prompt to add an item' do
      visit '/items'
      expect(page).to have_content 'No items yet'
      expect(page).to have_link 'Add an item'
    end
  end
end