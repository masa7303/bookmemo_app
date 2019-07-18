class AddBookTitleToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :book_title, :string
  end
end
