class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :price
      t.integer :rating
      t.string :store

      t.timestamps null: false
    end
  end
end
