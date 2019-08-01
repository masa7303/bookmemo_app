class AddLikeesToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :likees_count, :integer
    add_reference :comments, :user, foreign_key: true
  end
end
