class RemoveUserFromReview < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :user, :string
  end
end
