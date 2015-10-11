def upload_photo
  visit '/items'
  click_link 'Add an item'
  allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/photo.png")
  fill_in 'Description', with: 'my first photo'
  fill_in 'Price', with: '12'
  select 'Zara', from: 'Store'
  click_button 'Add item'
end
