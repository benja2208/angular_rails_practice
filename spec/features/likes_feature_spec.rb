require 'rails_helper'

feature 'liking photos' do
  before(:each) do
    user = build :user
    sign_up(user)
    # allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/spec/asset_specs/photos/tomato.jpg")
    byebug
    upload_photo
    # allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/spec/asset_specs/photos/tomato.jpg")

    # attach_file("photo[image]", "spec/asset_specs/photos/tomato.jpg")
  end

  it 'a user can like a photo, which increments the like count', js: true do
    byebug
    visit '/'
    click_link 'like'
    expect(page).to have_content("1 like")
  end
end