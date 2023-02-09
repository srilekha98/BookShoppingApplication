class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review_id
      t.integer :rating
      t.string :review

      t.timestamps
    end
    add_index :reviews, :review_id, unique: true
  end
end
