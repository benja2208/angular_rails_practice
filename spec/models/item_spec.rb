require 'spec_helper'

describe Item, type: :model do
  it { is_expected.to have_many :comments }
end
