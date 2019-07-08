class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :book, null: false
      t.text :body
      t.datetime :posted_at, null: false

      t.timestamps
    end
  end
end
