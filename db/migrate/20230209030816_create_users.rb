class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :address
      t.string :cc_num
      t.string :phone_num

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
