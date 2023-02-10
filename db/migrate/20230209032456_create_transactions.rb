class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_number
      t.string :credit_card_number
      t.string :address
      t.string :phone_number
      t.integer :quantity
      t.numeric :total_price

      t.timestamps
    end
  end
end
