class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total
      t.decimal :unit_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
