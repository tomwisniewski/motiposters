class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
