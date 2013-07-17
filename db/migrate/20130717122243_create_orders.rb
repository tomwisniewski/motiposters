class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.string :name
      t.string :street
      t.string :postcode
      t.string :city
      t.string :email

      t.timestamps
    end
  end
end
