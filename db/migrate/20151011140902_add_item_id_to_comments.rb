class AddItemIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :item, index: true, foreign_key: true
  end
end
