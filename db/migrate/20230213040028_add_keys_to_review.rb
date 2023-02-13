class AddKeysToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :user, :string
    add_column :reviews, :references, :string
    add_reference :reviews, :book, null: false, foreign_key: true
  end
end
