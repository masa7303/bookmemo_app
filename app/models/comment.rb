class Comment < ApplicationRecord
  belongs_to :title, class_name: "Book", foreign_key: "book_id"

  validates :body, presence: true
end
