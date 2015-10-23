require 'spec_helper'


describe Item, type: :model do
  it { is_expected.to have_many :comments }
end


describe Relationship, type: :model do 
  def setup
    @relationship = Relationship.new(follower_id: 1, followed_id: 2)
  end 

  it "should be valid" do 
    expect(@relationship).to be_valid
  end 

  it "should require a follower_id" do 
    expect(@relationship).to_not be_empty
  end 
end 

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @relationship = Relationship.new(follower_id: 1, followed_id: 2)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end