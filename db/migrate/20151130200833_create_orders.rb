class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :user_id
      t.text :name
      t.text :shipping_address
      t.text :status
      t.integer :total

      t.timestamps null: false
    end
  end
end
