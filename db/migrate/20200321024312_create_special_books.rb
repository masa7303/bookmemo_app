class CreateSpecialBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :special_books do |t|
      t.string :title
      t.string :author
      t.integer :user_id

      t.timestamps
    end
  end
end
