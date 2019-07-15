class Book < ApplicationRecord
  has_one_attached :picture
  attribute :new_picture
  attribute :remove_picture, :boolean

  # book が削除されると、同時にコメントも消される
  has_many :comments, dependent: :destroy

  # new_pictureが nil でも false でも無い場合に限りバリデーションを行う
  validate  if: :new_picture do
    # respond_to はあるオブジェクトが特定のメソッドを持っているかどうかを調べる
    if new_picture.respond_to?(:content_type)
      unless new_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_picture, :invalid_image_type)
      end
    else
      errors.add(:new_picture, :invalid)
    end
  end

  before_save do
    if new_picture
      self.picture = new_picture
    elsif remove_picture
      self.picture.purge
    end
  end

  scope :get_by_title, ->(title) {where("title like ?", "%#{title}%")
}

  def self.search(search)
    if search
      Book.where(['content LIKE ?', "%#{search}%"])
    else
      Book.all
    end
  end

end
