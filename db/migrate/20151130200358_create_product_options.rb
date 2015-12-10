class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.text :name
      t.integer :price_in_cents
      t.text :product_id

      t.timestamps null: false
    end
  end
end
