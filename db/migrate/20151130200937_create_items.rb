class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :order_id
      t.text :product_option_id
      t.text :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
