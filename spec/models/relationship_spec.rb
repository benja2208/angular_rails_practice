require 'spec_helper'


describe Item, type: :model do
  it { is_expected.to have_many :comments }
end


describe Relationship, type: :model do 
  @relationship = Relationship.new(follower_id: 1, followed_id: 2)

  xit "should be valid" do 
    expect(@relationship).to be_valid
  end 

  xit "should require a follower_id" do 
    @relationship.follower_id = nil
    expect(@relationship).to_not be_valid
  end 

  xit "should require a followed_id" do 
    @relationship.followed_id = nil
    expect(@relationship).to_not be_valid
  end 
end 
