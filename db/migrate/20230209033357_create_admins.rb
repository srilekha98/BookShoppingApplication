class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :id
      t.string :username
      t.string :password
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :admins, :id, unique: true
  end
end
